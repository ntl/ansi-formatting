require_relative '../../automated_init'

context "Writer" do
  context "Substitute" do
    text = Controls::Text.example

    style = Controls::Style.example

    substitute = Writer::Substitute.build

    substitute.sync do
      style(style) do
        text(text)
      end
    end

    control_string = "\e[#{style.code}m#{text}\e[#{style.reset_code}m"

    test "Output is captured by device" do
      assert(substitute.device.written?(control_string))
    end

    context "Written Predicate" do
      context "Positional Argument Given" do
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

      context "Block Argument Given" do
        context "Matches" do
          test "Returns true" do
            assert(substitute.written? {
              sync do
                style(style) do
                  text(text)
                end
              end
            })
          end
        end

        context "Does Not Match" do
          test "Returns false" do
            refute(substitute.written? {
              sync do
                style(style) do
                  text!(text)
                end
              end
            })
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
          substitute = Writer::Substitute.build

          test "Returns false" do
            refute(substitute.written?)
          end
        end
      end
    end
  end
end
