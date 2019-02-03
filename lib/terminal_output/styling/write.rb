module TerminalOutput
  module Styling
    class Write
      def raw_writer
        @raw_writer ||= Raw::Substitute.build
      end
      attr_writer :raw_writer

      def self.build(device=nil, render_styling: nil)
        instance = new
        Raw.configure(instance, device, render_styling: render_styling, attr_name: :raw_writer)
        instance
      end

      def text(text)
        raw_writer.text(text)
        self
      end

      def code(code)
        raw_writer.code(code)
        self
      end
    end
  end
end
