require_relative '../automated_init'

context "Writer" do
  context "Reset" do
    writer = Write.new

    return_value = writer.reset

    test "Writes reset code" do
      assert(writer.raw_writer.written?("\e[0m"))
    end

    test "Returns writer" do
      assert(return_value == writer)
    end
  end
end
