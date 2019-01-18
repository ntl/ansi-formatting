module TerminalOutput
  module Styling
    module Controls
      module Color
        module EightBit
          module Standard
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::EightBit::Standard.build(color_id)
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
                  :black_8bit,
                  :red_8bit,
                  :green_8bit,
                  :yellow_8bit,
                  :blue_8bit,
                  :magenta_8bit,
                  :cyan_8bit,
                  :white_8bit
                ]
              end
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = Standard.color_fragment(color_id)
                mode_fragment = EightBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = Standard.color_fragment(color_id)
                mode_fragment = EightBit::Background.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end
          end
        end
      end
    end
  end
end
