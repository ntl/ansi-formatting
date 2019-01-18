module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          def self.color_id?(color_id)
            Standard.color_id?(color_id) or
              HighIntensity.color_id?(color_id) or
              RGB.color_id?(color_id) or
              Greyscale.color_id?(color_id)
          end

          def self.get(color_id)
            Standard.get(color_id) or
              HighIntensity.get(color_id) or
              RGB.get(color_id) or
              Greyscale.get(color_id)
          end
        end
      end
    end
  end
end
