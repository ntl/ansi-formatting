module Fixtures
  module Writer
    class Style
      class Text
        include Fixture

        def control_text
          @control_text ||= Controls::Text.example
        end
        attr_writer :control_text

        def call
          context prose do
            writer = writer_class.new

            return_value = action.(writer, control_text)

            test_written(writer)

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end
        end

        def test_written(writer)
          test "Activates style, writes text, then resets style" do
            control_string = "\e[#{code}m#{control_text}\e[#{reset_code}m"

            assert(writer.device.written?(control_string))
          end
        end

        class Newline < Text
          def test_written(writer)
            test "Activates style, writes text, then resets style, then newline" do
              newline = Controls::Text::Newline.example

              control_string = "\e[#{code}m#{control_text}\e[#{reset_code}m#{newline}"

              assert(writer.device.written?(control_string))
            end
          end
        end
      end
    end
  end
end
