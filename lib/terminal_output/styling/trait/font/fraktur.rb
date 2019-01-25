module TerminalOutput
  module Styling
    module Trait
      module Font
        module Fraktur
          extend Trait

          def self.variant?(variant)
            codes.key?(variant)
          end

          def self.get(variant)
            codes[variant]
          end

          def self.reset_code
            fetch(:off)
          end

          def self.codes
            {
              :on => SGR::Code.fetch(:fraktur),
              :off => SGR::Code.fetch(:reset_fraktur)
            }
          end
        end
      end
    end
  end
end
