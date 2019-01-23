module TerminalOutput
  module Styling
    module Trait
      module Color
        module Background
          extend Trait

          def self.variant?(variant)
            Styling::Color.color_id?(variant)
          end

          def self.get(variant)
            color = Styling::Color.get(variant)

            color&.background
          end

          def self.reset_code
            SGR::Code.fetch(:reset_background)
          end
        end
      end
    end
  end
end
