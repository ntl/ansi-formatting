require_relative '../../automated_init'

context "Writer" do
  context "Device" do
    context "Newline" do
      newline_character = Controls::Text::Newline.example

      context "Text Mode" do
        device = Writer::Device.new
        assert(device.mode == Writer::Device::Mode.text)

        return_value = device.newline

        test "Writes newline to IO" do
          assert(device.io.string == newline_character)
        end

        test "Device remains in text mode" do
          assert(device.mode == Writer::Device::Mode.text)
        end

        test "Returns the number of bytes that were written" do
          assert(return_value == newline_character.bytesize)
        end
      end

      context "Escape Sequence Mode" do
        device = Writer::Device.new
        device.mode = Writer::Device::Mode.escape_sequence

        return_value = device.newline

        control_string = "m#{newline_character}"

        test "Terminates escape sequence and writes newline to IO" do
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
