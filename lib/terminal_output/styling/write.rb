module TerminalOutput
  module Styling
    class Write
      def raw_writer
        @raw_writer ||= Raw::Substitute.build
      end
      attr_writer :raw_writer

      def batching
        @batching ||= false
      end
      attr_writer :batching
      alias_method :batching?, :batching

      def self.build(device=nil, render_styling: nil)
        instance = new
        Raw.configure(instance, device, render_styling: render_styling, attr_name: :raw_writer)
        instance
      end

      def style(style, text=nil, &block)
        code = style.code

        batch do
          code(code)

          unless text.nil? && block.nil?
            text(text) unless text.nil?

            instance_exec(self, &block) unless block.nil?

            reset_style(style)
          end
        end
      end

      def reset_style(style)
        reset_code = style.reset_code

        batch do
          code(reset_code)
        end
      end

      def reset
        sgr(:reset)
      end

      def sgr(sgr_id)
        code = SGR::Code.fetch(sgr_id)

        batch do
          code(code)
        end
      end

      def batch(&block)
        if batching?
          instance_exec(self, &block)
          return self
        end

        self.batching = true

        begin
          return batch(&block)
        ensure
          raw_writer.sync
        end
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