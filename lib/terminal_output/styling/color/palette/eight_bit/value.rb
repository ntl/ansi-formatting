module TerminalOutput
  module Styling
    module Color
      module Palette
        module EightBit
          class Value < Value
            def foreground_fragment
              '38;5;'
            end

            def background_fragment
              '48;5;'
            end
          end
        end
      end
    end
  end
end
