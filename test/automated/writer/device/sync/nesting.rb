require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Sync" do
      context "Nesting" do
        context "Inner Block" do
          context "Leaves Device In Escape Sequence Mode" do
            code = Controls::SGR::Code.example

            device = Writer::Device.new

            written_text, device_mode, return_value = nil, nil, nil

            device.sync do
              return_value = device.sync do
                device.code(code)
              end

              written_text = device.io.string.dup

              device_mode = device.mode
            end

            test "Does not terminate escape sequence" do
              assert(written_text == "\e[#{code}")
            end

            test "Device remains in escape sequence mode" do
              assert(device_mode == Writer::Device::Mode.escape_sequence)
            end

            test "Return value indicates device is not synced" do
              refute(return_value)
            end
          end

          context "Leaves Device In Text Mode" do
            text = Controls::Text.example

            device = Writer::Device.new

            written_text, device_mode, return_value = nil, nil, nil

            device.sync do
              return_value = device.sync do
                device.text(text)
              end

              written_text = device.io.string.dup

              device_mode = device.mode
            end

            test "Writes nothing after block is executed" do
              assert(written_text == text)
            end

            test "Device remains in text mode" do
              assert(device_mode == Writer::Device::Mode.text)
            end

            test "Return value indicates device is synced" do
              assert(return_value)
            end
          end
        end
      end
    end
  end
end
