module TerminalOutput
  module Styling
    class Writer
      def device
        @device ||= Device::Substitute.build
      end
      attr_writer :device

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
