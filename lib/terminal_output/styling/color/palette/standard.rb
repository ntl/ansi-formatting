module TerminalOutput
  module Styling
    module Color
      module Palette
        class Standard < Value
          extend Cache

          def self.color_id?(color_id)
            color_fragments.key?(color_id)
          end

          def self.decode(color_id)
            color_fragments.fetch(color_id)
          end

          def foreground_fragment
            '3'
          end

          def background_fragment
            '4'
          end

          def self.color_fragments
            {
              :black => '0',
              :red => '1',
              :green => '2',
              :yellow => '3',
              :blue => '4',
              :magenta => '5',
              :cyan => '6',
              :white => '7',

              :text_bg => '0',
              :text_fg => '7'
            }
          end
        end
      end
    end
  end
end
