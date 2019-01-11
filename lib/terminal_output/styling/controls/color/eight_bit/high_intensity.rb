module TerminalOutput
  module Styling
    module Controls
      module Color
        module EightBit
          module HighIntensity
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::EightBit::HighIntensity.build(color_id)
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              scalar = ID.list.index(color_id)
              scalar += Standard::ID.list.count
              scalar.to_s
            end

            module ID
              def self.example
                list[0]
              end

              def self.list
                [
                  :intense_black_8bit,
                  :intense_red_8bit,
                  :intense_green_8bit,
                  :intense_yellow_8bit,
                  :intense_blue_8bit,
                  :intense_magenta_8bit,
                  :intense_cyan_8bit,
                  :intense_white_8bit
                ]
              end
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = HighIntensity.color_fragment(color_id)
                mode_fragment = EightBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = HighIntensity.color_fragment(color_id)
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
