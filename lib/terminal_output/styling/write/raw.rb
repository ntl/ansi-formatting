module TerminalOutput
  module Styling
    class Write
      class Raw
        attr_writer :device
        def device
          @device ||= StringIO.new
        end

        attr_writer :mode
        def mode
          @mode ||= Mode.text
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
