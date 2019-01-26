module TerminalOutput
  module Styling
    module Controls
      module Device
        def self.example
          String.example
        end

        module NonInteractive
          def self.example
            StringIO.new
          end
        end
        String = NonInteractive

        module Interactive
          def self.example
            $stdout
          end
        end
      end
    end
  end
end
