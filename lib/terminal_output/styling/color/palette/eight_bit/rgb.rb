module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          class RGB < Value
            extend Cache

            def self.color_id?(color_id)
              return false unless color_id.instance_of?(Integer)

              rgb = split(color_id)

              rgb.all? do |intensity|
                (0..5).include?(intensity)
              end
            end

            def self.decode(color_id)
              r, g, b = split(color_id)

              code = 16 + (r * 36) + (g * 6) + b

              code.to_s(10)
            end

            def self.split(color_id)
              scalar = color_id

              r, scalar = scalar.divmod(0100)
              g, scalar = scalar.divmod(0010)
              b = scalar

              return r, g, b
            end
          end
        end
      end
    end
  end
end
