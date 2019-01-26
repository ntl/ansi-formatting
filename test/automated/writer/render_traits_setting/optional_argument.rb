require_relative '../../automated_init'

context "Writer" do
  context "Render Traits Setting" do
    context "Optional Argument" do
      env = {}

      context "Argument Omitted" do
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

      context "Argument Given: True" do
        device = Controls::Device::NonInteractive.example
        refute(device.tty?)

        writer = Write.build(device, render_traits: true, env: env)

        test "Traits will be rendered" do
          assert(writer.render_traits?)
        end
      end

      context "Argument Given: Off" do
        device = Controls::Device::Interactive.example
        assert(device.tty?)

        writer = Write.build(device, render_traits: false, env: env)

        test "Traits will not be rendered" do
          refute(writer.render_traits?)
        end
      end
    end
  end
end
