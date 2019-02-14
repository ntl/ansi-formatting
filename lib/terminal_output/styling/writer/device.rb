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

        def newline
          text(newline_character)
        end

        def newline_character
          self.class.newline_character
        end

        def self.newline_character
          @newline_character ||= StringIO.new.tap(&:puts).string
        end

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
