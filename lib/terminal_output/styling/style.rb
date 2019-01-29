module TerminalOutput
  module Styling
    Style = Struct.new(:code, :reset_code)

    class Style
      Error = Class.new(RuntimeError)

      def combine!(style)
        combine(style, strict: true)
      end
      alias_method :+, :combine!

      def combine(style, strict: nil)
        strict ||= false

        codes = self.code.split(';')
        reset_codes = self.reset_code.split(';')

        if codes.include?(style.code)
          if strict
            raise Error, "Code #{code.inspect} already included in style (Code: #{self.code.inspect}, Reset Code: #{self.reset_code.inspect})"
          end
        else
          codes << style.code
        end

        if reset_codes.include?(style.reset_code)
          if strict
            raise Error, "Reset code #{reset_code.inspect} already included in style (Code: #{self.code.inspect}, Reset Code: #{self.reset_code.inspect})"
          end
        else
          reset_codes << style.reset_code
        end

        code = codes.join(';')
        reset_code = reset_codes.join(';')

        Style.new(code, reset_code)
      end
      alias_method :|, :combine
    end
  end
end
