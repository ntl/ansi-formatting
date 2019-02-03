require_relative '../automated_init'

context "Raw Writer" do
  context "Text Mode" do
    context "Write Text" do
      raw_writer = Write::Raw.new
      assert(raw_writer.mode == Write::Raw::Mode.text)

      raw_writer.text('Some text')

      test "Writes given text to device" do
        assert(raw_writer.device.string == 'Some text')
      end

      test "Writer remains in text mode" do
        assert(raw_writer.mode == Write::Raw::Mode.text)
      end
    end

    context "Sync" do
      raw_writer = Write::Raw.new
      assert(raw_writer.mode == Write::Raw::Mode.text)

      raw_writer.sync

      test "Writes nothing to device" do
        assert(raw_writer.device.string.empty?)
      end

      test "Writer remains in text mode" do
        assert(raw_writer.mode == Write::Raw::Mode.text)
      end
    end

    context "Write Code" do
      code = Controls::Style::Code.example

      raw_writer = Write::Raw.new
      assert(raw_writer.mode == Write::Raw::Mode.text)

      raw_writer.code(code)

      test "Initiates escape sequence starting with given code" do
        assert(raw_writer.device.string == "\e[#{code}")
      end

      test "Writer changes to escape mode" do
        assert(raw_writer.mode == Write::Raw::Mode.escape)
      end
    end
  end
end
