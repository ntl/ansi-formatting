module TerminalOutput
  module Styling
    module Apply
      def self.call(string, **arguments)
        string = string.dup

        self.!(string, **arguments)

        string
      end

      def self.!(string, fg: nil, bg: nil, style: nil, styles: nil)
        styles = Array(styles)
        styles << style unless style.nil?

        assure_mutable(string)

        previous_string = string.dup

        styles.map! do |style_name|
          Writer.public_send(style_name)
        end

        unless bg.nil?
          bg_style = Trait::Color::Background.style(bg)

          styles.unshift(bg_style)
        end

        unless fg.nil?
          fg_style = Trait::Color::Foreground.style(fg)

          styles.unshift(fg_style)
        end

        style = styles.reduce do |combined_style, style|
          combined_style + style
        end

        return nil if style.nil?

        Writer.(string) do
          style(style, previous_string)
        end

        previous_string
      end

      def self.assure_mutable(string)
        string.insert(0, '')
      end
    end
  end
end
