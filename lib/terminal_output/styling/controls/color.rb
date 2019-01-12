module TerminalOutput
  module Styling
    module Controls
      module Color
        module ID
          def self.example
            Standard::ID.example
          end
        end

        module Code
          def self.example(mode_fragment: nil, color_fragment: nil)
            mode_fragment ||= Standard::Foreground.mode_fragment
            color_fragment ||= Standard::Foreground.color_fragment

            "#{mode_fragment}#{color_fragment}"
          end
        end
      end
    end
  end
end
