module TerminalOutput
  module Styling
    class Write
      class Raw
        class Substitute < Raw
          def self.build(string=nil)
            instance = new

            unless string.nil?
              instance.device.write(string)
            end

            instance
          end

          def written?(text=nil)
            if text.nil?
              !device.string.empty?
            else
              device.string == text
            end
          end
        end
      end
    end
  end
end
