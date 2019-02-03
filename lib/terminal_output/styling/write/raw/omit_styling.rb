module TerminalOutput
  module Styling
    class Write
      class Raw
        class OmitStyling < Raw
          def text(text)
            device.write(text)
          end

          def code(_)
          end

          def sync
            device.fsync
          end
        end
      end
    end
  end
end
