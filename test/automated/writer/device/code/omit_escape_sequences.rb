require_relative '../../../automated_init'

context "Writer" do
  context "Device" do
    context "Code" do
      context "Omit Escape Sequences" do
        code = Controls::SGR::Code.example

        device = Writer::Device.new
        assert(device.mode == Writer::Device::Mode.text)

        device.omit_escape_sequences!

        return_value = device.code(code)

        test "Does not initiate an escape sequence" do
          assert(device.io.string.empty?)
        end

        test "Device remains in text mode" do
          assert(device.mode == Writer::Device::Mode.text)
        end

        test "Return value indicates zero bytes were written" do
          assert(return_value.zero?)
        end
      end
    end
  end
end
