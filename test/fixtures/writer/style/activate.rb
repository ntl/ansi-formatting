module Fixtures
  class Writer
    class Style
      class Activate
        include TestBench::Bootstrap::Fixture

        attr_reader :writer_class
        attr_reader :style_control
        attr_reader :activate_style

        def initialize(writer_class, style_control, activate_style)
          @writer_class = writer_class
          @style_control = style_control
          @activate_style = activate_style
        end

        def self.call(writer_class: nil, activate: nil, style:)
          writer_class ||= TerminalOutput::Styling::Write

          activate ||= proc { |writer, text=nil, &block|
            writer.style(style, text, &block)
          }

          instance = new(writer_class, style, activate)
          instance.()
        end

        def call
          context "Activate" do
            context "Neither Text Nor Block Arguments Given" do
              writer = writer_class.new

              return_value = activate_style.(writer)

              test "Returns the writer" do
                assert(return_value == writer)
              end

              test "Activates style" do
                assert(writer.raw_writer.written?("\e[#{control_code}m"))
              end
            end

            context "Text Argument Given" do
              writer = writer_class.new

              return_value = activate_style.(writer, 'Some text')

              test "Returns the writer" do
                assert(return_value == writer)
              end

              test "Activates the style, writes the text, then resets the style" do
                control_text = escape('Some text')

                assert(writer.raw_writer.written?(control_text))
              end
            end

            context "Block Argument Given" do
              writer = writer_class.new

              block_context = nil

              return_value = activate_style.(writer) do
                block_context = self

                writer.text('Some text')
              end

              test "Returns the writer" do
                assert(return_value == writer)
              end

              test "Executes block in writer's instance context" do
                assert(block_context == writer)
              end

              test "Activates the style, executes the block, then resets the style" do
                control_text = escape('Some text')

                assert(writer.raw_writer.written?(control_text))
              end
            end

            context "Text and Block Arguments Given" do
              writer = writer_class.new

              activate_style.(writer, 'Some text') do
                text('Other text')
              end

              test "Writes the given text before executing the block" do
                control_text = escape('Some textOther text')

                assert(writer.raw_writer.written?(control_text))
              end
            end
          end
        end

        def escape(text)
          "\e[#{control_code}m#{text}\e[#{control_reset_code}m"
        end

        def control_code
          style_control.code
        end

        def control_reset_code
          style_control.reset_code
        end
      end
    end
  end
end
