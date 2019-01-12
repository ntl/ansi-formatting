module TerminalOutput
  module Styling
    module Color
      module Palette
        module TwentyFourBit
          class Unabridged < Value
            def self.pattern
              %r{\A
                (?:\#|0[xX])
                  (?<r>[[:xdigit:]]{2})
                  (?<g>[[:xdigit:]]{2})
                  (?<b>[[:xdigit:]]{2})
              \z}x
            end

            def self.decode_pigment(pigment)
              pigment.to_i(16)
            end
          end
        end
      end
    end
  end
end
