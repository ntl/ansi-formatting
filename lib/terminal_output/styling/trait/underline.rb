module TerminalOutput
  module Styling
    module Trait
      module Underline
        extend Trait

        def self.variant?(variant)
          codes.key?(variant)
        end

        def self.get(variant)
          codes[variant]
        end

        def self.default_code
          fetch(:single)
        end

        def self.reset_code
          fetch(:none)
        end

        def self.codes
          {
            :single => SGR::Code.fetch(:underline),
            :double => SGR::Code.fetch(:double_underline),
            :none => SGR::Code.fetch(:reset_underline)
          }
        end
      end
    end
  end
end
