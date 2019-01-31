require_relative '../../automated_init'

context "Writer" do
  context "Sync" do
    context "Writer Mode: Styling" do
      writer = Write.new
      writer.mode = Write::Mode.styling

      return_value = writer.sync

      test "Terminates escape sequence" do
        assert(writer.device.string == 'm')
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
