module TerminalOutput
  module Styling
    module Color
      module Palette
        module TwentyFourBit
          class Abridged < Value
            extend Cache

            def self.pattern
              %r{\A
                \#
                  (?<r>[[:xdigit:]])
                  (?<g>[[:xdigit:]])
                  (?<b>[[:xdigit:]])
              \z}x
            end

            def self.decode_pigment(pigment)
              scalar = pigment.to_i(16)

              (scalar * 16) + scalar
            end
          end
        end
      end
    end
  end
end
