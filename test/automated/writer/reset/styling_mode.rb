require_relative '../../automated_init'

context "Writer" do
  context "Reset" do
    context "Writer Mode: Styling" do
      writer = Write.new
      writer.mode = Write::Mode.styling

      return_value = writer.reset

      test "Continues escape sequence and writes reset code" do
        assert(writer.device.string.start_with?(";#{Controls::SGR::Code.reset}m"))
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
