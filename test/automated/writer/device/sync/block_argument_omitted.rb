require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Sync" do
      context "Block Argument Omitted" do
        context "Escape Sequence Mode" do
          device = Writer::Device.new
          device.mode = Writer::Device::Mode.escape_sequence

          return_value = device.sync

          test "Terminates escape sequence" do
            assert(device.io.string == 'm')
          end

          test "Return value indicates device is synced" do
            assert(return_value == true)
          end
        end

        context "Text Mode" do
          device = Writer::Device.new
          assert(device.mode == Writer::Device::Mode.text)

          return_value = device.sync

          test "Writes nothing" do
            assert(device.io.string.empty?)
          end

          test "Return value indicates device is synced" do
            assert(return_value == true)
          end
        end
      end
    end
  end
end
