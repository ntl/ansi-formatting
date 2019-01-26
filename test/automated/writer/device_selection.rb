require_relative '../automated_init'

context "Writer" do
  context "Device Selection" do
    context "Device Given" do
      device_argument = Controls::Device.example

      writer = Write.build(device_argument)

      test "Device is the one given" do
        assert(writer.device == device_argument)
      end
    end

    context "String Given" do
      device_argument = 'Some string'

      writer = Write.build(device_argument)

      test "Device is an IO interface to the given string" do
        assert(writer.device.instance_of?(StringIO))
        assert(writer.device.string.equal?(device_argument))
      end
    end

    context "Neither Device Nor String Given" do
      writer = Write.build

      test "Device is an IO interface to a new string" do
        assert(writer.device.instance_of?(StringIO))
      end
    end
  end
end
