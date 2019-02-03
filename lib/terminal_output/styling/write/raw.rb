module TerminalOutput
  module Styling
    class Write
      class Raw
        Error = Class.new(RuntimeError)

        def device
          @device ||= StringIO.new
        end
        attr_writer :device

        def mode
          @mode ||= Mode.text
        end
        attr_writer :mode

        def self.configure(receiver, device=nil, render_styling: nil, env: nil, attr_name: nil)
          attr_name ||= :write

          instance = Build.(device, render_styling: render_styling, env: env)
          receiver.public_send("#{attr_name}=", instance)
          instance
        end

        def text(text)
          if mode == Mode.escape
            device.write('m')

            self.mode = Mode.text
          end

          unless text.empty?
            device.write(text)
          end
        end

        def code(code)
          if mode == Mode.text
            device.write("\e[")

            self.mode = Mode.escape
          else
            device.write(';')
          end

          device.write(code)
        end

        def sync
          text('')

          device.flush
        end

        module Mode
          def self.text
            :text
          end

          def self.escape
            :escape
          end
        end
      end
    end
  end
end
