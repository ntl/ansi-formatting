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
