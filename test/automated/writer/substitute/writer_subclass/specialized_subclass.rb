require_relative '../../../automated_init'

context "Writer" do
  context "Substitute" do
    context "Writer Subclass" do
      context "Specialized Subclass" do
        text = Controls::Text.example

        writer_class = Controls::Writer.example_class do
          def some_method(text)
            text(text.swapcase)
          end
        end

        substitute = writer_class::Substitute.build

        substitute.some_method(text)

        test "Subclass method is invoked on substitute" do
          control_text = text.swapcase
          refute(control_text == text)

          assert(substitute.written?(control_text))
        end
      end
    end
  end
end
