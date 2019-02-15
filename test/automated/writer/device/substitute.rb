require_relative '../../automated_init'

context "Writer" do
  context "Device" do
    context "Substitute" do
      substitute = Writer::Device::Substitute.build

      text = Controls::Text.example
      code = Controls::SGR::Code.example

      substitute.sync do
        substitute.text(text)
        substitute.newline
        substitute.code(code)
      end

      test "Text" do
        assert(substitute.io.string.include?(text))
      end

      test "Newline" do
        newline = Controls::Text::Newline.example

        assert(substitute.io.string.include?(newline))
      end

      test "Code" do
        assert(substitute.io.string.include?("\e[#{code}m"))
      end

      context "Written Predicate" do
        written_text = "#{text}\n\e[#{code}m"

        context "Argument Given" do
          context "Matches Text That Was Written" do
            test "Returns true" do
              assert(substitute.written?(written_text))
            end
          end

          context "Does Not Match Text That Was Written" do
            test "Returns false" do
              refute(substitute.written?(written_text[0...-1]))
            end
          end
        end

        context "No Argument" do
          context "Data Was Written" do
            test "Returns true" do
              assert(substitute.written?)
            end
          end

          context "No Data Was Written" do
            substitute = Writer::Device::Substitute.build

            test "Returns false" do
              refute(substitute.written?)
            end
          end
        end
      end
    end
  end
end
