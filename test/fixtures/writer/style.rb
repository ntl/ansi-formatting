module Fixtures
  module Writer
    module Style
      def self.included(cls)
        cls.class_exec do
          extend Build
          extend Call
        end
      end

      attr_reader :action

      def code
        control_style.code
      end

      def reset_code
        control_style.reset_code
      end

      def control_style
        @control_style ||= Controls::Style.example
      end
      attr_writer :control_style

      def writer_class
        @writer_class ||= TerminalOutput::Styling::Writer
      end
      attr_writer :writer_class

      def initialize(action)
        @action = action
      end

      module Build
        def build(style: nil, writer_class: nil, &action)
          instance = new(action)
          instance.control_style = style unless style.nil?
          instance.writer_class = writer_class unless writer_class.nil?
          instance
        end
      end

      module Call
        def call(prose=nil, **arguments, &action)
          instance = build(**arguments, &action)
          instance.(prose)
        end
      end
    end
  end
end
