require_relative '../../automated_init'

context "Writer" do
  context "Append" do
    context "Writer Mode: Text" do
      text = 'Some text'

      writer = Write.new
      assert(writer.mode == Write::Mode.text)

      return_value = writer.append(text)

      test "Text is written to device" do
        assert(writer.device.string == text)
      end

      test "Writer remains in text mode" do
        assert(writer.mode == Write::Mode.text)
      end

      test "Returns writer" do
        assert(return_value == writer)
      end
    end
  end
end
