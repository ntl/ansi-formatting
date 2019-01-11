module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          class HighIntensity < Value
            extend Cache

            def self.color_id?(color_id)
              color_fragments.key?(color_id)
            end

            def self.decode(color_id)
              color_fragments.fetch(color_id)
            end

            def self.color_fragments
              {
                :intense_black_8bit => '8',
                :intense_red_8bit => '9',
                :intense_green_8bit => '10',
                :intense_yellow_8bit => '11',
                :intense_blue_8bit => '12',
                :intense_magenta_8bit => '13',
                :intense_cyan_8bit => '14',
                :intense_white_8bit => '15',

                :intense_text_bg_8bit => '8',
                :intense_text_fg_8bit => '15'
              }
            end
          end
        end
      end
    end
  end
end
