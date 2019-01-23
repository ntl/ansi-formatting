module TerminalOutput
  module Styling
    module Trait
      module Overline
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
            :on => SGR::Code.fetch(:overline),
            :off => SGR::Code.fetch(:reset_overline)
          }
        end
      end
    end
  end
end
