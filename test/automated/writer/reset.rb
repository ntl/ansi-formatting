require_relative '../automated_init'

context "Writer" do
  context "Reset" do
    writer = Writer.new

    return_value = writer.reset

    test "Writes SGR reset code to device" do
      writer.device.sync

      control_code = Controls::SGR::Code.reset

      assert(writer.device.written?("\e[#{control_code}m"))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
