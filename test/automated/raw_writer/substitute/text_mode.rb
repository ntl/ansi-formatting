require_relative '../../automated_init'

context "Raw Writer" do
  context "Text Mode" do
    context "Write Text" do
      substitute = Write::Raw::Substitute.build
      assert(substitute.mode == Write::Raw::Mode.text)

      substitute.text('Some text')

      test "Writer remains in text mode" do
        assert(substitute.mode == Write::Raw::Mode.text)
      end

      test "Writes given text" do
        assert(substitute.written?('Some text'))
      end
    end

    context "Sync" do
      substitute = Write::Raw::Substitute.build
      assert(substitute.mode == Write::Raw::Mode.text)

      substitute.sync

      test "Writer remains in text mode" do
        assert(substitute.mode == Write::Raw::Mode.text)
      end

      test "Writes nothing" do
        refute(substitute.written?)
        assert(substitute.written?(''))
      end
    end

    context "Write Code" do
      code = Controls::Style::Code.example

      substitute = Write::Raw::Substitute.build
      assert(substitute.mode == Write::Raw::Mode.text)

      substitute.code(code)

      test "Writer changes to escape mode" do
        assert(substitute.mode == Write::Raw::Mode.escape)
      end

      test "Initiates escape sequence starting with given code" do
        assert(substitute.written?("\e[#{code}"))
      end
    end
  end
end
