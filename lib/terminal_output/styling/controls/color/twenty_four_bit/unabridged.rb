module TerminalOutput
  module Styling
    module Controls
      module Color
        module TwentyFourBit
          module Unabridged
            def self.example(color_id=nil)
              color_id ||= ID.example

              Styling::Color::TwentyFourBit::Unabridged.build(color_id)
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              scalar = color_id.match(/[[:xdigit:]]+\z/).to_s.to_i(16)

              r, scalar = scalar.divmod(0x010000)
              g, scalar = scalar.divmod(0x000100)
              b = scalar

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
                hexadecimal = "%02X%02X%02X" % [r, g, b]

                [
                  "##{hexadecimal}",
                  "0x#{hexadecimal}",
                  "0X#{hexadecimal}",
                  "##{hexadecimal.downcase}",
                  "0x#{hexadecimal.downcase}",
                  "0X#{hexadecimal.downcase}"
                ]
              end

              def self.scale(gradient_steps: nil)
                gradient_steps ||= :minimum

                TerminalOutput::Styling::Color::Mode::RGB.scale(gradient_depth, gradient_steps: gradient_steps)
              end

              def self.gradient_depth
                256
              end
            end
            def self.color_id
              '0x000000'
            end

            def self.color_fragment(color_id=nil)
              color_id ||= ID.example

              scalar = color_id.match(/[[:xdigit:]]+\z/).to_s.to_i(16)

              r, scalar = scalar.divmod(0x010000)
              g, scalar = scalar.divmod(0x000100)
              b = scalar

              "#{r};#{g};#{b}"
            end

            module Foreground
              def self.code(color_id=nil)
                color_fragment = Unabridged.color_fragment(color_id)
                mode_fragment = TwentyFourBit::Foreground.mode_fragment

                Code.example(mode_fragment: mode_fragment, color_fragment: color_fragment)
              end
            end

            module Background
              def self.code(color_id=nil)
                color_fragment = Unabridged.color_fragment(color_id)
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
