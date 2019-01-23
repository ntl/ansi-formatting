module TerminalOutput
  module Styling
    module Trait
      module Color
        module Foreground
          extend Trait

          def self.variant?(variant)
            Styling::Color.color_id?(variant)
          end

          def self.get(variant)
            color = Styling::Color.get(variant)

            color&.foreground
          end

          def self.reset_code
            SGR::Code.fetch(:reset_display)
          end
        end
      end
    end
  end
end
