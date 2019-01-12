module TerminalOutput
  module Styling
    module Controls
      module Color
        module EightBit
          module Greyscale
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::EightBit::Greyscale.build(color_id)
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              scalar = color_id.match(/[[:digit:]]+\z/).to_s.to_i
              scalar += 232 - 1
              scalar.to_s
            end

            module ID
              def self.example
                list[0]
              end

              def self.list
                (1..24).flat_map do |scalar|
                  [:"grey_#{scalar}", :"gray_#{scalar}"]
                end
              end
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = Greyscale.color_fragment(color_id)
                mode_fragment = EightBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = Greyscale.color_fragment(color_id)
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
