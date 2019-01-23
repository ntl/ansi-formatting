module TerminalOutput
  module Styling
    module Trait
      Error = Class.new(RuntimeError)

      def fetch(variant)
        get(variant) or
          raise Error, "Unknown variant `#{variant.inspect}' (Trait: #{self.inspect})"
      end

      def style(variant)
        code = fetch(variant)

        Style.new(code, reset_code)
      end
    end
  end
end
