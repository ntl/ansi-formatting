module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          class Standard < Value
            extend Cache

            def self.color_id?(color_id)
              color_fragments.key?(color_id)
            end

            def self.decode(color_id)
              color_fragments.fetch(color_id)
            end

            def self.color_fragments
              {
                :black_8bit => '0',
                :red_8bit => '1',
                :green_8bit => '2',
                :yellow_8bit => '3',
                :blue_8bit => '4',
                :magenta_8bit => '5',
                :cyan_8bit => '6',
                :white_8bit => '7',

                :text_bg_8bit => '0',
                :text_fg_8bit => '7'
              }
            end
          end
        end
      end
    end
  end
end
