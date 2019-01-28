require_relative '../../automated_init'

context "Writer" do
  context "Reset" do
    context "Writer Mode: Text" do
      writer = Write.new
      assert(writer.mode == Write::Mode.text)

      return_value = writer.reset

      test "Initiates escape sequence and writes reset code" do
        assert(writer.device.string.start_with?("\e[#{Controls::SGR::Code.reset}m"))
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
