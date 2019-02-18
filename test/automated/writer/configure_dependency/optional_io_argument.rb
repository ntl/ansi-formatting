require_relative '../../automated_init'

context "Writer" do
  context "Configure Dependency" do
    context "Optional IO Argument" do
      receiver = OpenStruct.new

      writer = Writer.configure(receiver)

      context "Given" do
        io = Controls::IO.example

        writer = Writer.configure(receiver, io)

        test "Writer will write to given IO" do
          assert(writer.device.io.equal?(io))
        end
      end

      context "Omitted" do
        writer = Writer.configure(receiver)

        test "Configured device writes to /dev/stdout" do
          assert(writer.device.io.equal?($stdout))
        end
      end
    end
  end
end
