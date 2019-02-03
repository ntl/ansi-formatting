require_relative '../automated_init'

context "Writer" do
  context "SGR" do
    writer = Write.new

    sgr_id = Controls::SGR::ID.example

    return_value = writer.sgr(sgr_id)

    test "Writes code corresponding to identifier" do
      control_code = Controls::SGR::Code.example

      assert(writer.raw_writer.written?("\e[#{control_code}m"))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
