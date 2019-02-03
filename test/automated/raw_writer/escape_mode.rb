require_relative '../automated_init'

context "Raw Writer" do
  context "Escape Mode" do
    example_code = Controls::Style::Code.example

    context "Write Code" do
      code = Controls::Style::Code.alternate

      raw_writer = Write::Raw.new
      raw_writer.mode = Write::Raw::Mode.escape
      raw_writer.device.write("\e[#{example_code}")

      raw_writer.code(code)

      test "Continues escape sequence with the given code" do
        assert(raw_writer.device.string == "\e[#{example_code};#{code}")
      end

      test "Writer remains in escape mode" do
        assert(raw_writer.mode == Write::Raw::Mode.escape)
      end
    end

    context "Sync" do
      raw_writer = Write::Raw.new
      raw_writer.mode = Write::Raw::Mode.escape
      raw_writer.device.write("\e[#{example_code}")

      raw_writer.sync

      test "Terminates escape sequence" do
        assert(raw_writer.device.string == "\e[#{example_code}m")
      end

      test "Writer changes to text mode" do
        assert(raw_writer.mode == Write::Raw::Mode.text)
      end
    end

    context "Write Text" do
      raw_writer = Write::Raw.new
      raw_writer.mode = Write::Raw::Mode.escape
      raw_writer.device.write("\e[#{example_code}")

      raw_writer.text('Some text')

      test "Terminates escape sequence and writes given text to device" do
        assert(raw_writer.device.string == "\e[#{example_code}mSome text")
      end

      test "Writer changes to text mode" do
        assert(raw_writer.mode == Write::Raw::Mode.text)
      end
    end
  end
end
