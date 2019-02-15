require_relative '../automated_init'

context "Writer" do
  context "Code" do
    writer = Writer.new

    code = Controls::SGR::Code.example

    return_value = writer.code(code)

    test "Writes given code to device" do
      writer.device.sync

      assert(writer.device.written?("\e[#{code}m"))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
