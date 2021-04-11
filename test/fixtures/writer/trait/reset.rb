module Fixtures
  module Writer
    class Trait
      class Reset
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
          @writer_class = writer_class
        end

        def self.build(name:, trait:, writer_class: nil)
          style = trait.style

          instance = new(name, style)
          instance.writer_class = writer_class unless writer_class.nil?
          instance
        end

        def call
          reset_method = :"reset_#{name}"

          fixture(
            Style::Reset,
            style: style,
            writer_class: writer_class
          ) do |writer|
            writer.public_send(reset_method)
          end
        end
      end
    end
  end
end
