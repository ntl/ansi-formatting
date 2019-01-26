require_relative '../../automated_init'

context "Writer" do
  context "Render Traits Setting" do
    context "Environment Variable Given" do
      context "Set: \"on\"" do
        env = { 'TERMINAL_OUTPUT_STYLING' => 'on' }

        device = Controls::Device::NonInteractive.example
        refute(device.tty?)

        writer = Write.build(device, env: env)

        test "Traits will be rendered" do
          assert(writer.render_traits?)
        end
      end

      context "Set: \"off\"" do
        env = { 'TERMINAL_OUTPUT_STYLING' => 'off' }

        device = Controls::Device::Interactive.example
        assert(device.tty?)

        writer = Write.build(device, env: env)

        test "Traits will not be rendered" do
          refute(writer.render_traits?)
        end
      end

      ['detect', '', nil].each do |value|
        context "Set: #{value.inspect}" do
          env = { 'TERMINAL_OUTPUT_STYLING' => value }

          context "Device is Interactive" do
            device = Controls::Device::Interactive.example
            assert(device.tty?)

            writer = Write.build(device, env: env)

            test "Traits will be rendered" do
              assert(writer.render_traits?)
            end
          end

          context "Device is Non-Interactive" do
            device = Controls::Device::NonInteractive.example
            refute(device.tty?)

            writer = Write.build(device, env: env)

            test "Traits will not be rendered" do
              refute(writer.render_traits?)
            end
          end
        end
      end

      context "Set: \"unknown\"" do
        env = { 'TERMINAL_OUTPUT_STYLING' => 'unknown' }

        device = Controls::Device.example

        begin
          Write.build(device, env: env)
        rescue Write::Error => error
        end

        test "Raises error" do
          refute(error.nil?)
        end
      end
    end
  end
end
