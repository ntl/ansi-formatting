module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          class Greyscale < Value
            extend Cache

            def self.color_id?(color_id)
              color_fragments.key?(color_id)
            end

            def self.decode(color_id)
              color_fragments.fetch(color_id)
            end

            def self.color_fragments
              (1..24).flat_map do |scalar|
                color_fragment = 232 + scalar - 1

                [
                  [:"grey_#{scalar}", color_fragment],
                  [:"gray_#{scalar}", color_fragment]
                ]
              end.to_h
            end
          end
        end
      end
    end
  end
end
