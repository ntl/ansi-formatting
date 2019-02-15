require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Configure Dependency" do
      receiver = OpenStruct.new

      device = Writer::Device.configure(receiver)

      test "Configures given receiver attribute" do
        assert(receiver.device.is_a?(Writer::Device))
      end

      test "Returns the configured device" do
        assert(device.equal?(receiver.device))
      end
    end
  end
end
