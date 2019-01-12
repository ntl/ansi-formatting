module TerminalOutput
  module Styling
    module Controls
      module Color
        module TwentyFourBit
          module Abridged
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::TwentyFourBit::Abridged.build(color_id)
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              r, g, b = color_id.match(/[[:xdigit:]]{3}\z/).to_s.each_char.to_a

              r = "#{r}#{r}".to_i(16)
              g = "#{g}#{g}".to_i(16)
              b = "#{b}#{b}".to_i(16)

              "#{r};#{g};#{b}"
            end

            module ID
              def self.example
                list.first
              end

              def self.list(gradient_steps: nil)
                scale(gradient_steps: gradient_steps).flat_map do |r, g, b|
                  variants(r, g, b)
                end
              end

              def self.variants(r, g, b)
                r = r % 16
                g = g % 16
                b = b % 16

                hexadecimal = "%01X%01X%01X" % [r, g, b]

                [
                  "##{hexadecimal}",
                  "##{hexadecimal.downcase}"
                ]
              end

              def self.scale(gradient_steps: nil)
                gradient_steps ||= self.gradient_steps

                TerminalOutput::Styling::Color::Mode::RGB.scale(gradient_depth, gradient_steps: gradient_steps)
              end

              def self.gradient_depth
                Unabridged::ID.gradient_depth
              end

              def self.gradient_steps
                17
              end
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = Abridged.color_fragment(color_id)
                mode_fragment = TwentyFourBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = Abridged.color_fragment(color_id)
                mode_fragment = TwentyFourBit::Background.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end
          end
        end
      end
    end
  end
end
