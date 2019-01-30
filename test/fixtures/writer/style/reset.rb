module Fixtures
  class Writer
    class Style
      class Reset
        include TestBench::Bootstrap::Fixture

        attr_reader :writer_class
        attr_reader :style_control
        attr_reader :reset_style

        def initialize(writer_class, style_control, reset_style)
          @writer_class = writer_class
          @style_control = style_control
          @reset_style = reset_style
        end

        def self.call(writer_class: nil, reset: nil, style:)
          writer_class ||= TerminalOutput::Styling::Write

          reset ||= proc { |writer|
            writer.reset_style(style)
          }

          instance = new(writer_class, style, reset)
          instance.()
        end

        def call
          context "Reset" do
            writer = writer_class.new

            return_value = reset_style.(writer)

            test "Returns writer" do
              assert(return_value == writer)
            end

            test "Resets style" do
              assert(writer.raw_writer.written?("\e[#{control_reset_code}m"))
            end
          end
        end

        def control_reset_code
          style_control.reset_code
        end
      end
    end
  end
end
