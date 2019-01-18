module TerminalOutput
  module Styling
    module Color
      module Palette
        module TwentyFourBit
          class Value < Value
            def self.color_id?(color_id)
              rgb = split(color_id)

              !rgb.nil?
            end

            def self.decode(color_id)
              r, g, b = split(color_id)

              "#{r.to_s(10)};#{g.to_s(10)};#{b.to_s(10)}"
            end

            def foreground_fragment
              "38;2;"
            end

            def background_fragment
              "48;2;"
            end

            def self.split(color_id)
              match_data = pattern.match(color_id.to_s)

              return nil if match_data.nil?

              r = decode_pigment(match_data[:r])
              g = decode_pigment(match_data[:g])
              b = decode_pigment(match_data[:b])

              return r, g, b
            end

            def self.pattern
              %r{\z\A}
            end
          end
        end
      end
    end
  end
end
