module TerminalOutput
  module Styling
    module Trait
      module Font
        module Weight
          extend Trait

          def self.variant?(variant)
            codes.key?(variant)
          end

          def self.get(variant)
            codes[variant]
          end

          def self.default_code
            fetch(:bold)
          end

          def self.reset_code
            fetch(:normal)
          end

          def self.codes
            {
              :bold => SGR::Code.fetch(:bold),
              :faint => SGR::Code.fetch(:faint),
              :normal => SGR::Code.fetch(:reset_intensity)
            }
          end
        end
      end
    end
  end
end
