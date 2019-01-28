require_relative '../../automated_init'

context "Writer" do
  context "SGR Code" do
    context "Writer Mode: Styling" do
      sgr_code = Controls::SGR::Code.example

      writer = Write.new
      writer.mode = Write::Mode.styling

      return_value = writer.sgr_code(sgr_code)

      test "Continues escape sequence and writes SGR code" do
        assert(writer.device.string.start_with?(";#{sgr_code}"))
      end

      test "Writer remains in styling mode" do
        assert(writer.mode == Write::Mode.styling)
      end

      test "Returns writer" do
        assert(return_value == writer)
      end
    end
  end
end
