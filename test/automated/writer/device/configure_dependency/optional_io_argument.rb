require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Configure Dependency" do
      context "Optional IO Argument" do
        receiver = OpenStruct.new

        context "Given" do
          context "IO Object" do
            io = Controls::IO.example

            device = Writer::Device.configure(receiver, io)

            test "Configured device writes to given IO object" do
              assert(device.io.equal?(io))
            end
          end

          context "String" do
            string = String.new

            device = Writer::Device.configure(receiver, string, env: {})

            test "Configured device writes to given string" do
              assert(device.io.string.equal?(string))
            end

            test "Configured device does not omit escape sequences" do
              refute(device.omit_escape_sequences?)
            end
          end
        end

        context "Omitted" do
          device = Writer::Device.configure(receiver)

          test "Configured device writes to /dev/stdout" do
            assert(device.io.equal?($stdout))
          end
        end
      end
    end
  end
end
