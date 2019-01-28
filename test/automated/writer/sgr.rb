require_relative '../automated_init'

context "Writer" do
  context "SGR" do
    writer = Write.new

    sgr_id = Controls::SGR::ID.example

    return_value = writer.sgr(sgr_id)

    test "Initiates escape sequence and writes SGR code for given identifier" do
      control_code = Controls::SGR::Code.example

      assert(writer.device.string.start_with?("\e[#{control_code}"))
    end

    test "Returns writer" do
      assert(return_value == writer)
    end
  end
end
