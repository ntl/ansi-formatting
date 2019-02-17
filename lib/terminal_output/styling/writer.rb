module TerminalOutput
  module Styling
    class Writer
      def device
        @device ||= Device::Substitute.build
      end
      attr_writer :device

      def style(style, text=nil, &block)
        code = style.code

        code(code)

        unless text.nil? && block.nil?
          device.sync do
            text(text) unless text.nil?

            instance_exec(self, &block) unless block.nil?

            reset_style(style)
          end
        end

        self
      end

      def reset_style(style)
        reset_code = style.reset_code

        code(reset_code)
      end

      def reset
        sgr(:reset)
      end

      def sgr(sgr_id)
        code = SGR::Code.fetch(sgr_id)

        code(code)
      end

      def sync(&block)
        unless block.nil?
          device.sync do
            instance_exec(self, &block)
          end
        else
          device.sync
        end

        self
      end

      def code(code)
        device.code(code)
        self
      end

      def newline
        device.newline
        self
      end

      def text!(text)
        text(text)
        newline
      end

      def text(text)
        device.text(text)
        self
      end
    end
  end
end
