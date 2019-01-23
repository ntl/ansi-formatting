module TerminalOutput
  module Styling
    module Trait
      module Font
        module Slant
          extend Trait

          def self.variant?(variant)
            codes.key?(variant)
          end

          def self.get(variant)
            codes[variant]
          end

          def self.reset_code
            fetch(:normal)
          end

          def self.codes
            {
              :italic => SGR::Code.fetch(:italic),
              :normal => SGR::Code.fetch(:reset_italic)
            }
          end
        end
      end
    end
  end
end
