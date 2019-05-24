require_relative '../../automated_init'

context "Writer" do
  context "Device" do
    context "Text" do
      text = Controls::Text.example

      context "Text Mode" do
        device = Writer::Device.new
        assert(device.mode == Writer::Device::Mode.text)

        return_value = device.text(text)

        test "Writes given text to IO" do
          assert(device.io.string == text)
        end

        test "Device remains in text mode" do
          assert(device.mode == Writer::Device::Mode.text)
        end

        test "Returns the number of bytes that were written" do
          assert(return_value == text.bytesize)
        end
      end

      context "Escape Sequence Mode" do
        device = Writer::Device.new
        device.mode = Writer::Device::Mode.escape_sequence

        return_value = device.text(text)

        control_string = "m#{text}"

        test "Terminates escape sequence and writes given text to IO" do
          assert(device.io.string == control_string)
        end

        test "Device changes to text mode" do
          assert(device.mode == Writer::Device::Mode.text)
        end

        test "Returns the number of bytes that were written" do
          assert(return_value == control_string.bytesize)
        end
      end
    end
  end
end
