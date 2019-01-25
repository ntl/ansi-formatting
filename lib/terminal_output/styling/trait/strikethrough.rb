module TerminalOutput
  module Styling
    module Trait
      module Strikethrough
        extend Trait

        def self.variant?(variant)
          codes.key?(variant)
        end

        def self.get(variant)
          codes[variant]
        end

        def self.default_code
          fetch(:on)
        end

        def self.reset_code
          fetch(:off)
        end

        def self.codes
          {
            :on => SGR::Code.fetch(:crossed_out),
            :off => SGR::Code.fetch(:reset_crossed_out)
          }
        end
      end
    end
  end
end
