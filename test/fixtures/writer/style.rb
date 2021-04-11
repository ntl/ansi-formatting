module Fixtures
  module Writer
    class Style
      include TestBench::Fixture

      def writer_class
        @writer_class ||= TerminalOutput::Styling::Writer
      end
      attr_writer :writer_class

      attr_reader :name
      attr_reader :style

      def initialize(name, style)
        @name = name
        @style = style
      end

      def self.build(name:, style:, writer_class: nil)
        instance = new(name, style)
        instance.writer_class = writer_class unless writer_class.nil?
        instance
      end

      def call
        fixture(
          Activate,
          "Activate",
          style: style,
          writer_class: writer_class
        ) do |writer|
          writer.public_send(name)
        end

        fixture(
          Reset,
          "Reset",
          style: style,
          writer_class: writer_class
        ) do |writer|
          writer.public_send(:"reset_#{name}")
        end

        fixture(
          Text,
          "Text",
          style: style,
          writer_class: writer_class
        ) do |writer, text|
          writer.public_send(name, text)
        end

        fixture(
          Text::Newline,
          "Text (Newline Variant)",
          style: style,
          writer_class: writer_class
        ) do |writer, text|
          writer.public_send(:"#{name}!", text)
        end

        fixture(
          Block,
          "Block",
          style: style,
          writer_class: writer_class
        ) do |writer, &block|
          writer.public_send(name, &block)
        end
      end
    end
  end
end
