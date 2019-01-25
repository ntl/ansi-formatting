module TerminalOutput
  module Styling
    module Trait
      module Color
        module Foreground
          module Transparent
            extend Trait

            def self.variant?(variant)
              codes.key?(variant)
            end

            def self.get(variant)
              codes[variant]
            end

            def self.reset_code
              fetch(:off)
            end

            def self.codes
              {
                :on => SGR::Code.fetch(:conceal),
                :off => SGR::Code.fetch(:reset_conceal)
              }
            end
          end
        end
      end
    end
  end
end
