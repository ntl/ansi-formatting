module TerminalOutput
  module Styling
    module Controls
      module Color
        module EightBit
          module RGB
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::EightBit::RGB.build(color_id)
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              octal = color_id

              r, octal = octal.divmod(0100)
              g, octal = octal.divmod(0010)
              b = octal

              scalar = (r * 36) + (g * 6) + b

              16 + scalar
            end

            module ID
              def self.example
                list.first
              end

              def self.list(gradient_steps: nil)
                gradient_steps ||= :minimum

                scale = TerminalOutput::Styling::Color::Mode::RGB.scale(gradient_depth, gradient_steps: gradient_steps)

                scale.map do |r, g, b|
                  (r * 0100) + (g * 0010) + b
                end
              end

              def self.gradient_depth
                6
              end
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = RGB.color_fragment(color_id)
                mode_fragment = EightBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = RGB.color_fragment(color_id)
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
