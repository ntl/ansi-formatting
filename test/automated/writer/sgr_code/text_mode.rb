require_relative '../../automated_init'

context "Writer" do
  context "SGR Code" do
    context "Writer Mode: Text" do
      sgr_code = Controls::SGR::Code.example

      writer = Write.new
      assert(writer.mode == Write::Mode.text)

      return_value = writer.sgr_code(sgr_code)

      test "Initiates escape sequence and writes SGR code" do
        assert(writer.device.string.start_with?("\e[#{sgr_code}"))
      end

      test "Writer changes to styling mode" do
        assert(writer.mode == Write::Mode.styling)
      end

      test "Returns writer" do
        assert(return_value == writer)
      end
    end
  end
end
