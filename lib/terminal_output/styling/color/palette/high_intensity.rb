module TerminalOutput
  module Styling
    module Color
      module Palette
        class HighIntensity < Value
          extend Cache

          def self.color_id?(color_id)
            color_fragments.key?(color_id)
          end

          def self.decode(color_id)
            color_fragments.fetch(color_id)
          end

          def foreground_fragment
            '9'
          end

          def background_fragment
            '10'
          end

          def self.color_fragments
            {
              :intense_black => '0',
              :intense_red => '1',
              :intense_green => '2',
              :intense_yellow => '3',
              :intense_blue => '4',
              :intense_magenta => '5',
              :intense_cyan => '6',
              :intense_white => '7',

              :intense_text_bg => '0',
              :intense_text_fg => '7'
            }
          end
        end
      end
    end
  end
end
