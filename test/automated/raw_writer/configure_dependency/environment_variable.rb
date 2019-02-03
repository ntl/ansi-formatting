require_relative '../../automated_init'

context "Raw Writer" do
  context "Configure Dependency" do
    context "Environment Variable" do
      context "On" do
        receiver = OpenStruct.new

        env = { 'TERMINAL_OUTPUT_STYLING' => 'on' }

        Write::Raw.configure(receiver, env: env)

        test "Configures receiver with raw writer" do
          assert(receiver.write.instance_of?(Write::Raw))
        end
      end

      context "Off" do
        receiver = OpenStruct.new

        env = { 'TERMINAL_OUTPUT_STYLING' => 'off' }

        Write::Raw.configure(receiver, env: env)

        test "Configures receiver with raw writer that omits styling" do
          assert(receiver.write.instance_of?(Write::Raw::OmitStyling))
        end
      end

      context "Detect" do
        env = { 'TERMINAL_OUTPUT_STYLING' => 'detect' }

        context "Device Is Interactive" do
          device = Controls::Device::Interactive.example
          assert(device.tty?)

          receiver = OpenStruct.new

          Write::Raw.configure(receiver, device, env: env)

          test "Configures receiver with raw writer" do
            assert(receiver.write.instance_of?(Write::Raw))
          end
        end

        context "Device Is Non-Interactive" do
          device = Controls::Device::Interactive::Non.example
          refute(device.tty?)

          receiver = OpenStruct.new

          Write::Raw.configure(receiver, device, env: env)

          test "Configures receiver with raw writer that omits styling" do
            assert(receiver.write.instance_of?(Write::Raw::OmitStyling))
          end
        end
      end

      context "Unknown" do
        receiver = OpenStruct.new

        env = { 'TERMINAL_OUTPUT_STYLING' => 'unknown' }

        begin
          Write::Raw.configure(receiver, env: env)
        rescue Write::Raw::Error => error
        end

        test "Raises error" do
          refute(error.nil?)
        end
      end
    end
  end
end
