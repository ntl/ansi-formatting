require_relative '../automated_init'

context "Writer" do
  context "Batch" do
    code = Controls::SGR::Code.example

    context "No Batch Is In Progress" do
      writer = Write.new
      refute(writer.batching?)

      block_context = nil

      return_value = writer.batch do
        writer.code(code)

        block_context = self
      end

      test "Terminates escape sequences written by block" do
        assert(writer.raw_writer.written?("\e[#{code}m"))
      end

      test "Executes block in writer's instance context" do
        assert(block_context == writer)
      end

      test "Returns the writer" do
        assert(return_value == writer)
      end
    end

    context "Batch Is Already In Progress" do
      writer = Write.new
      writer.batching = true

      block_context = nil

      return_value = writer.batch do
        writer.code(code)

        block_context = self
      end

      test "Does not terminate escape sequences written by block" do
        assert(writer.raw_writer.written?("\e[#{code}"))
      end

      test "Executes block in writer's instance context" do
        assert(block_context == writer)
      end

      test "Returns the writer" do
        assert(return_value == writer)
      end
    end
  end
end
