module Fixtures
  class Writer
    class Style
      include TestBench::Bootstrap::Fixture

      attr_reader :writer_class
      attr_reader :style_control
      attr_reader :activate_style
      attr_reader :reset_style

      def initialize(writer_class, style_control, activate_style, reset_style)
        @writer_class = writer_class
        @style_control = style_control
        @activate_style = activate_style
        @reset_style = reset_style
      end

      def self.call(writer_class: nil, style:, activate:, reset:)
        writer_class ||= TerminalOutput::Styling::Write

        instance = new(writer_class, style, activate, reset)
        instance.()
      end

      def call
        context "Activation" do
          context "Neither Text Nor Block Arguments Given" do
            writer = writer_class.new

            return_value = activate_style.(writer)

            test "Writes SGR code(s)" do
              written_text = written_text(writer)

              assert(written_text.include?(control_code))
            end

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end

          context "Text Argument Given" do
            writer = writer_class.new

            return_value = activate_style.(writer, 'Some text')

            test "Writes SGR code(s), then appends the text, then writes SGR reset code(s)" do
              written_text = written_text(writer)

              control_text = "#{control_code}mSome text\e[#{control_reset_code}"

              assert(written_text.include?(control_text))
            end

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end

          context "Block Argument Given" do
            writer = writer_class.new

            block_context = nil

            return_value = activate_style.(writer) do
              block_context = self

              writer.append('Some text')
            end

            test "Writes SGR code(s), executes the block, then writes SGR reset code(s)" do
              written_text = written_text(writer)

              control_text = "#{control_code}mSome text\e[#{control_reset_code}"

              assert(written_text.include?(control_text))
            end

            test "Executes block in writer's instance context" do
              assert(block_context == writer)
            end

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end

          context "Text and Block Arguments Given" do
            writer = writer_class.new

            activate_style.(writer, 'Some text') do
              append('Other text')
            end

            test "Writes the given text before executing the block" do
              written_text = written_text(writer)

              assert(written_text.include?('Some textOther text'))
            end
          end
        end

        context "Reset" do
          writer = writer_class.new

          reset_style.(writer)

          test "Writes SGR reset code(s)" do
            written_text = written_text(writer)

            assert(written_text.include?(control_reset_code))
          end
        end
      end

      def written_text(writer)
        writer.device.string
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
