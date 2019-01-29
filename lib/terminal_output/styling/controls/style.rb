module TerminalOutput
  module Styling
    module Controls
      module Style
        def self.example(code: nil, reset_code: nil)
          code ||= Code.example
          reset_code ||= Code::Reset.example

          Styling::Style.new(code, reset_code)
        end

        def self.alternate(code: nil, reset_code: nil)
          code ||= Code.alternate
          reset_code ||= Code::Reset.alternate

          example(code: code, reset_code: reset_code)
        end

        module Code
          def self.example
            SGR::Code.example(:bold)
          end

          def self.alternate
            SGR::Code.example(:italic)
          end

          module Reset
            def self.example
              SGR::Code.example(:reset_intensity)
            end

            def self.alternate
              SGR::Code.example(:reset_italic)
            end
          end
        end
      end
    end
  end
end
