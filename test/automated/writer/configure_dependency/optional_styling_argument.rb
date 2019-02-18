require_relative '../../automated_init'

context "Writer" do
  context "Configure Dependency" do
    context "Optional Styling Argument" do
      receiver = OpenStruct.new

      context "Value: True" do
        io = Controls::IO::Interactive::Non.example

        writer = Writer.configure(receiver, io, styling: true)

        test "Device does not omit escape sequences" do
          refute(writer.device.omit_escape_sequences?)
        end
      end

      context "Value: False" do
        io = Controls::IO::Interactive.example

        writer = Writer.configure(receiver, io, styling: false)

        test "Device omits escape sequences" do
          assert(writer.device.omit_escape_sequences?)
        end
      end
    end
  end
end
