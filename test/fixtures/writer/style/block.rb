module Fixtures
  module Writer
    class Style
      class Block
        include Fixture

        def control_text
          @control_text ||= Controls::Text.example
        end
        attr_writer :control_text

        def call
          context prose do
            writer = writer_class.new

            block_context, block_argument = nil, nil

            text = self.control_text

            return_value = action.(writer) do |_block_argument|
              block_context = self
              block_argument = _block_argument

              writer.text(text)
            end

            test "Activates style, executes block, then resets style" do
              control_string = "\e[#{control_style.code}m#{text}\e[#{control_style.reset_code}m"

              assert(writer.device.written?(control_string))
            end

            test "Executes block in writer's instance context" do
              assert(block_context == writer)
            end

            test "Passes the writer to the block" do
              assert(block_argument == writer)
            end

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end
        end
      end
    end
  end
end
