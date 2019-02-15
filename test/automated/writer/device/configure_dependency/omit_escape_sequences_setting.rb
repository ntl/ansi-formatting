require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Configure Dependency" do
      context "Omit Escape Sequences Setting" do
        receiver = OpenStruct.new

        context "Interactive IO Object" do
          io = Controls::IO::Interactive.example
          assert(io.tty?)

          context "Default" do
            device = Writer::Device.configure(receiver, io)

            test "Configured device does not omit escape sequences" do
              refute(device.omit_escape_sequences?)
            end
          end

          context "Environment Variable: detect" do
            env = { 'TERMINAL_OUTPUT_STYLING' => 'detect' }

            device = Writer::Device.configure(receiver, io, env: env)

            test "Configured device does not omit escape sequences" do
              refute(device.omit_escape_sequences?)
            end
          end

          context "Environment Variable: off" do
            env = { 'TERMINAL_OUTPUT_STYLING' => 'off' }

            device = Writer::Device.configure(receiver, io, env: env)

            test "Configured device omits escape sequences" do
              assert(device.omit_escape_sequences?)
            end
          end

          context "Optional Styling Argument: false" do
            device = Writer::Device.configure(receiver, io, styling: false)

            test "Configured device omits escape sequences" do
              assert(device.omit_escape_sequences?)
            end
          end
        end

        context "Non-Interactive IO Object" do
          io = Controls::IO::Interactive::Non.example
          refute(io.tty?)

          context "Default" do
            device = Writer::Device.configure(receiver, io)

            test "Configured device omits escape sequences" do
              assert(device.omit_escape_sequences?)
            end
          end

          context "Environment Variable: detect" do
            env = { 'TERMINAL_OUTPUT_STYLING' => 'detect' }

            device = Writer::Device.configure(receiver, io, env: env)

            test "Configured device omits escape sequences" do
              assert(device.omit_escape_sequences?)
            end
          end

          context "Environment Variable: on" do
            env = { 'TERMINAL_OUTPUT_STYLING' => 'on' }

            device = Writer::Device.configure(receiver, io, env: env)

            test "Configured device does not omit escape sequences" do
              refute(device.omit_escape_sequences?)
            end
          end

          context "Optional Styling Argument: true" do
            device = Writer::Device.configure(receiver, io, styling: true)

            test "Configured device does not omit escape sequences" do
              refute(device.omit_escape_sequences?)
            end
          end
        end
      end
    end
  end
end
