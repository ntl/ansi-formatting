module TerminalOutput
  module Styling
    module Trait
      module Blink
        extend Trait

        def self.variant?(variant)
          codes.key?(variant)
        end

        def self.get(variant)
          codes[variant]
        end

        def self.default_code
          fetch(:slow)
        end

        def self.reset_code
          fetch(:off)
        end

        def self.codes
          {
            :slow => SGR::Code.fetch(:blink),
            :rapid => SGR::Code.fetch(:rapid_blink),
            :off => SGR::Code.fetch(:reset_blink)
          }
        end
      end
    end
  end
end
