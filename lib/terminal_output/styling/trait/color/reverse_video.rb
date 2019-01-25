module TerminalOutput
  module Styling
    module Trait
      module Color
        module ReverseVideo
          extend Trait

          def self.variant?(variant)
            codes.key?(variant)
          end

          def self.get(variant)
            codes[variant]
          end

          def self.default_code
            fetch(:on)
          end

          def self.reset_code
            fetch(:off)
          end

          def self.codes
            {
              :on => SGR::Code.fetch(:negative_image),
              :off => SGR::Code.fetch(:positive_image)
            }
          end
        end
      end
    end
  end
end
