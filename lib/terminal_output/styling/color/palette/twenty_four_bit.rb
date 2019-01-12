module TerminalOutput
  module Styling
    module Color
      module Palette
        module TwentyFourBit
          def self.color_id?(color_id)
            Abridged.color_id?(color_id) or
              Unabridged.color_id?(color_id)
          end

          def self.get(color_id)
            Abridged.get(color_id) or
              Unabridged.get(color_id)
          end
        end
      end
    end
  end
end
