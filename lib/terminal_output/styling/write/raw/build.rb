module TerminalOutput
  module Styling
    class Write
      class Raw
        module Build
          def self.call(device=nil, render_styling: nil, env: nil)
            if render_styling.nil?
              render_styling = render_styling?(device, env)
            end

            cls = render_styling ? Raw : Raw::OmitStyling

            instance = cls.new
            instance.device = device unless device.nil?
            instance
          end

          def self.render_styling?(device, env=nil)
            env ||= ENV

            case value = env['TERMINAL_OUTPUT_STYLING']
            when 'on'
              true
            when 'off'
              false
            when 'detect', '', nil
              device&.tty?
            else
              raise Error, "Invalid value for ENV['TERMINAL_OUTPUT_STYLING'] (Given: #{value.inspect}, Valid Values: `on', `off', `detect')"
            end
          end
        end
      end
    end
  end
end
