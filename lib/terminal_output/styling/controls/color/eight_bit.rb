module TerminalOutput
  module Styling
    module Controls
      module Color
        module EightBit
          def self.example
            Standard.example
          end

          def self.color_id
            Standard.color_id
          end

          module ID
            def self.example
              Standard::ID.example
            end
          end

          module Foreground
            def self.code
              Standard::Foreground.code
            end

            def self.mode_fragment
              '38;5;'
            end
          end

          module Background
            def self.code
              Standard::Background.code
            end

            def self.mode_fragment
              '48;5;'
            end
          end
        end
      end
    end
  end
end
