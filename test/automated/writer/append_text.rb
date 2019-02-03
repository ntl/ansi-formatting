require_relative '../automated_init'

context "Writer" do
  context "Append Text" do
    writer = Write.new

    return_value = writer.text('Some text')

    test "Writes given text to device" do
      assert(writer.raw_writer.written?('Some text'))
    end

    test "Returns the writer" do
      assert(return_value == writer)
    end
  end
end
