require_relative '../../automated_init'

context "Writer" do
  context "Append" do
    context "Writer Mode: Styling" do
      text = 'Some text'

      writer = Write.new
      writer.mode = Write::Mode.styling

      return_value = writer.append(text)

      test "Terminates escape sequence and writes text" do
        assert(writer.device.string == "m#{text}")
      end

      test "Writer changes to text mode" do
        assert(writer.mode == Write::Mode.text)
      end

      test "Returns writer" do
        assert(return_value == writer)
      end
    end
  end
end
