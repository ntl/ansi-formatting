require_relative '../automated_init'

context "Writer" do
  context "Append Code" do
    writer = Write.new

    code = Controls::Style::Code.example

    return_value = writer.code(code)

    test "Writes given code to device" do
      assert(writer.raw_writer.written?("\e[#{code}"))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
