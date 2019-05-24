require_relative '../automated_init'

context "Writer" do
  context "Sync" do
    code = Controls::SGR::Code.example
    control_string = "\e[#{code}m"

    context "Block Argument Omitted" do
      writer = Writer.new

      writer.device.code(code)

      refute(writer.device.written?(control_string))

      return_value = writer.sync

      test "Terminates escape sequences" do
        assert(writer.device.written?(control_string))
      end

      test "Returns the writer" do
        assert(return_value == writer)
      end
    end

    context "Block Argument Given" do
      writer = Writer.new

      block_context, block_argument = nil, nil

      return_value = writer.sync do |_block_argument|
        block_context = self
        block_argument = _block_argument

        writer.device.code(code)
      end

      test "Terminates escape sequences" do
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
