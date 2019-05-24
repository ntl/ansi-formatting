require_relative '../../../automated_init'

context "Writer" do
  context "Substitute" do
    context "Writer Subclass" do
      trait = Controls::Trait.example

      style = Controls::Style.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait)

        style(:some_style, style)
      end

      text = Controls::Text.example

      substitute = writer_class::Substitute.build

      substitute.sync do
        some_style do
          some_trait do
            text!(text)
          end
        end
      end

      newline = Controls::Text::Newline.example

      control_string = "\e[#{style.code};#{trait.default_code}m#{text}#{newline}\e[#{trait.reset_code};#{style.reset_code}m"

      test "Output is captured by device" do
        assert(substitute.device.written?(control_string))
      end

      context "Written Predicate" do
        context "Argument Given" do
          context "Matches Text That Was Written" do
            test "Returns true" do
              assert(substitute.written?(control_string))
            end
          end

          context "Does Not Match Text That Was Written" do
            test "Returns false" do
              refute(substitute.written?(control_string[0...-1]))
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
            substitute = writer_class::Substitute.build

            test "Returns false" do
              refute(substitute.written?)
            end
          end
        end
      end
    end
  end
end
