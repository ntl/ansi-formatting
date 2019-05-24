require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Sync" do
      context "Escape Sequence Mode" do
        context "Block Leaves Device In Escape Sequence Mode" do
          code = Controls::SGR::Code.example

          device = Writer::Device.new
          device.mode = Writer::Device::Mode.escape_sequence

          return_value = device.sync do
            device.code(code)
          end

          test "Terminates escape sequence initiated by block" do
            assert(device.io.string == ";#{code}m")
          end

          test "Device changes to text mode" do
            assert(device.mode == Writer::Device::Mode.text)
          end

          test "Return value indicates device is synced" do
            assert(return_value == true)
          end
        end

        context "Block Changes Device To Text Mode" do
          text = Controls::Text.example

          device = Writer::Device.new
          device.mode = Writer::Device::Mode.escape_sequence

          return_value = device.sync do
            device.text(text)
          end

          test "Writes nothing after block is executed" do
            assert(device.io.string == "m#{text}")
          end

          test "Device remains in text mode" do
            assert(device.mode == Writer::Device::Mode.text)
          end

          test "Return value indicates device is synced" do
            assert(return_value == true)
          end
        end
      end
    end
  end
end
