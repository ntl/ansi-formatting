require_relative '../automated_init'

context "Writer" do
  context "Newline" do
    writer = Writer.new

    return_value = writer.newline

    test "Writes newline to device" do
      newline = Controls::Text::Newline.example

      assert(writer.device.written?(newline))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
