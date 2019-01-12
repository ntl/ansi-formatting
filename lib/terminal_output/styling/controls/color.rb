module TerminalOutput
  module Styling
    module Controls
      module Color
        def self.example(color_id=nil)
          color_id ||= ID.example

          TerminalOutput::Styling::Color.get(color_id)
        end

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

        module Foreground
          def self.code(color_id=nil)
            color = Color.example(color_id)

            color.foreground
          end

          def self.reset_code
            SGR::Code.reset_display
          end

          module String
            def self.example(string=nil, color_id: nil)
              code = Foreground.code(color_id)
              reset_code = Foreground.reset_code

              Controls::String::Traitd.example(string, code: code, reset_code: reset_code)
            end
          end
        end

        module Background
          def self.code(color_id=nil)
            color = Color.example(color_id)

            color.background
          end

          def self.reset_code
            SGR::Code.reset_background
          end

          module String
            def self.example(string=nil, color_id: nil)
              code = Background.code(color_id)
              reset_code = Background.reset_code

              Controls::String::Traitd.example(string, code: code, reset_code: reset_code)
            end
          end
        end
      end
    end
  end
end
