require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Code" do
      code = Controls::SGR::Code.example

      context "Text Mode" do
        device = Writer::Device.new
        assert(device.mode == Writer::Device::Mode.text)

        return_value = device.code(code)

        control_string = "\e[#{code}"

        test "Initiates escape sequence with given code" do
          assert(device.io.string == control_string)
        end

        test "Device changes to escape sequence mode" do
          assert(device.mode == Writer::Device::Mode.escape_sequence)
        end

        test "Returns the number of bytes that were written" do
          assert(return_value == control_string.bytesize)
        end
      end

      context "Escape Sequence Mode" do
        device = Writer::Device.new
        device.mode = Writer::Device::Mode.escape_sequence

        return_value = device.code(code)

        control_string = ";#{code}"

        test "Continues escape sequence with given code" do
          assert(device.io.string == control_string)
        end

        test "Device remains in escape sequence mode" do
          assert(device.mode == Writer::Device::Mode.escape_sequence)
        end

        test "Returns the number of bytes that were written" do
          assert(return_value == control_string.bytesize)
        end
      end
    end
  end
end
