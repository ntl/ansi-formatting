module TerminalOutput
  module Styling
    module Controls
      module Color
        module TwentyFourBit
          def self.example
            Unabridged.example
          end

          def self.color_id
            Unabridged.color_id
          end

          module ID
            def self.example
              Unabridged::ID.example
            end
          end

          module Foreground
            def self.code
              Unabridged::Foreground.code
            end

            def self.mode_fragment
              '38;2;'
            end
          end

          module Background
            def self.code
              Unabridged::Background.code
            end

            def self.mode_fragment
              '48;2;'
            end
          end
        end
      end
    end
  end
end
