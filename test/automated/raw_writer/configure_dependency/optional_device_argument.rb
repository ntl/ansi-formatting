require_relative '../../automated_init'

context "Raw Writer" do
  context "Configure Dependency" do
    context "Optional Device Argument" do
      context "Given" do
        receiver = OpenStruct.new

        device = Controls::Device.example

        Write::Raw.configure(receiver, device)

        writer = receiver.write

        test "Configured writer writes to given device" do
          assert(writer.device.equal?(device))
        end
      end

      context "Omitted" do
        receiver = OpenStruct.new

        Write::Raw.configure(receiver)

        writer = receiver.write

        test "Configured writer writes to inert device" do
          assert(writer.device.instance_of?(StringIO))
        end
      end
    end
  end
end
