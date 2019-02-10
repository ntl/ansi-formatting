module TerminalOutput
  module Styling
    class Write
      module StyleMacro
        def style_macro(name, *styles)
          style = styles.reduce(&:combine)

          define_method(name) do |text=nil, &block|
            style(style, text, &block)
          end

          define_method(:"reset_#{name}") do
            reset_style(style)
          end

          define_singleton_method(name) do
            style
          end
        end
        alias_method :style, :style_macro
      end
    end
  end
end
