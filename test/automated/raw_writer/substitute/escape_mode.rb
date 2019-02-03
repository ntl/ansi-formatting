require_relative '../../automated_init'

context "Raw Writer" do
  context "Escape Mode" do
    example_code = Controls::Style::Code.example

    context "Write Code" do
      code = Controls::Style::Code.alternate

      substitute = Write::Raw::Substitute.build("\e[#{example_code}")
      substitute.mode = Write::Raw::Mode.escape

      substitute.code(code)

      test "Writer remains in escape mode" do
        assert(substitute.mode == Write::Raw::Mode.escape)
      end

      test "Continues escape sequence with the given code" do
        assert(substitute.written?("\e[#{example_code};#{code}"))
      end
    end

    context "Sync" do
      substitute = Write::Raw::Substitute.build("\e[#{example_code}")
      substitute.mode = Write::Raw::Mode.escape

      substitute.sync

      test "Writer changes to text mode" do
        assert(substitute.mode == Write::Raw::Mode.text)
      end

      test "Terminates escape sequence" do
        assert(substitute.written?("\e[#{example_code}m"))
      end
    end

    context "Write Text" do
      substitute = Write::Raw::Substitute.build("\e[#{example_code}")
      substitute.mode = Write::Raw::Mode.escape

      substitute.text('Some text')

      test "Writer changes to text mode" do
        assert(substitute.mode == Write::Raw::Mode.text)
      end

      test "Terminates escape sequence and writes given text" do
        assert(substitute.written?("\e[#{example_code}mSome text"))
      end
    end
  end
end
