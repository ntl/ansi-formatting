module TerminalOutput
  module Styling
    class Writer
      class Device
        def io
          @io ||= StringIO.new
        end
        attr_writer :io

        def mode
          @mode ||= Mode.text
        end
        attr_writer :mode

        def text(text)
          bytes_written = 0

          if mode == Mode.escape_sequence
            bytes_written += io.write('m')

            self.mode = Mode.text
          end

          bytes_written += io.write(text)
          bytes_written
        end

        module Mode
          def self.text
            :text
          end

          def self.escape_sequence
            :escape_sequence
          end
        end
      end
    end
  end
end
