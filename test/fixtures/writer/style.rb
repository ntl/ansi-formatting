module Fixtures
  module Writer
    module Style
      def self.call(name:, style:, writer_class: nil)
        Activate.("Activate", style: style, writer_class: writer_class) do |writer|
          writer.public_send(name)
        end

        Reset.("Reset", style: style, writer_class: writer_class) do |writer|
          writer.public_send(:"reset_#{name}")
        end

        Text.("Text", style: style, writer_class: writer_class) do |writer, text|
          writer.public_send(name, text)
        end

        Text::Newline.("Text (Newline Variant)", style: style, writer_class: writer_class) do |writer, text|
          writer.public_send(:"#{name}!", text)
        end

        Block.("Block", style: style, writer_class: writer_class) do |writer, &block|
          writer.public_send(name, &block)
        end
      end

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
