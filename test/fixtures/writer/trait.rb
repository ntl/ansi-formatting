module Fixtures
  module Writer
    class Trait
      include TestBench::Fixture

      def writer_class
        @writer_class ||= TerminalOutput::Styling::Writer
      end
      attr_writer :writer_class

      attr_reader :name
      attr_reader :trait
      attr_reader :variant

      def initialize(name, trait, variant)
        @name = name
        @trait = trait
        @variant = variant
      end

      def self.build(name:, trait:, variant:, writer_class: nil)
        instance = new(name, trait, variant)
        instance.writer_class = writer_class unless writer_class.nil?
        instance
      end

      def call
        [
          ClassMethod,
          Activate,
          Text,
          Text::Newline,
          Block
        ].each do |fixture_cls|
          fixture(
            fixture_cls,
            name: name,
            trait: trait,
            variant: variant,
            writer_class: writer_class
          )
        end

        fixture(
          Reset,
          name: name,
          trait: trait,
          writer_class: writer_class
        )
      end
    end
  end
end
