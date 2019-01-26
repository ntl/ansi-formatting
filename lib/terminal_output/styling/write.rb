module TerminalOutput
  module Styling
    class Write
      Error = Class.new(RuntimeError)

      attr_writer :device
      def device
        @device ||= StringIO.new
      end

      attr_writer :render_traits
      def render_traits
        return @render_traits if defined?(@render_traits)
        @render_traits = true
      end

      def self.build(device=nil, env: nil, render_traits: nil)
        if device.is_a?(String)
          device = StringIO.new(device)
        end

        instance = new
        instance.device = device unless device.nil?

        if render_traits.nil?
          render_traits = render_traits_setting(instance.device, env: env)
        end

        instance.render_traits = render_traits
        instance
      end

      alias_method :render_traits?, :render_traits

      def self.render_traits_setting(device, env: nil)
        env ||= ::ENV

        case value = env['TERMINAL_OUTPUT_STYLING']
        when 'on'
          true
        when 'off'
          false
        when 'detect', '', nil
          device.tty?
        else
          raise Error, "Unknown value for ENV['TERMINAL_OUTPUT_STYLING'] (Value: #{value.inspect}, Accepted Values: 'on', 'off', 'detect')"
        end
      end
    end
  end
end
