require_relative '../automated_init'

context "Writer" do
  context "Text" do
    text = Controls::Text.example

    context do
      writer = Writer.new

      return_value = writer.text(text)

      test "Writes given text to device" do
        assert(writer.device.written?(text))
      end

      test "Returns the writer" do
        assert(return_value == writer)
      end
    end

    context "Newline Variant" do
      writer = Writer.new

      return_value = writer.text!(text)

      test "Writes given text then newline to device" do
        newline = Controls::Text::Newline.example

        assert(writer.device.written?("#{text}#{newline}"))
      end

      test "Returns the writer" do
        assert(return_value == writer)
      end
    end
  end
end
