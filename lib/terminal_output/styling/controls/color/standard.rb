module TerminalOutput
  module Styling
    module Controls
      module Color
        module Standard
          def self.example(color_id=nil)
            color_id ||= ID.example

            Styling::Color::Standard.build(color_id)
          end

          def self.color_fragment(color_id=nil)
            color_id ||= ID.example

            scalar = ID.list.index(color_id)
            scalar.to_s
          end

          module ID
            def self.example
              list[0]
            end

            def self.list
              [
                :black,
                :red,
                :green,
                :yellow,
                :blue,
                :magenta,
                :cyan,
                :white
              ]
            end
          end

          module Foreground
            def self.code(color_id=nil)
              color_fragment = Standard.color_fragment(color_id)

              Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
            end

            def self.mode_fragment
              '3'
            end
          end

          module Background
            def self.code(color_id=nil)
              color_fragment = Standard.color_fragment(color_id)

              Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
            end

            def self.mode_fragment
              '4'
            end
          end
        end
      end
    end
  end
end
