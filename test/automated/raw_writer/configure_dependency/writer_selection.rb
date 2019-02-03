require_relative '../../automated_init'

context "Raw Writer" do
  context "Configure Dependency" do
    context "Writer Selection" do
      context "Device Is Interactive" do
        device = Controls::Device::Interactive.example
        assert(device.tty?)

        receiver = OpenStruct.new

        Write::Raw.configure(receiver, device)

        test "Configures receiver with raw writer" do
          assert(receiver.write.instance_of?(Write::Raw))
        end
      end

      context "Device Is Non-Interactive" do
        device = Controls::Device::Interactive::Non.example
        refute(device.tty?)

        receiver = OpenStruct.new

        Write::Raw.configure(receiver, device)

        test "Configures receiver with raw writer that omits styling" do
          assert(receiver.write.instance_of?(Write::Raw::OmitStyling))
        end
      end
    end
  end
end
