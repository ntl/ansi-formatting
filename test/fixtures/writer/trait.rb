module Fixtures
  module Writer
    module Trait
      def self.call(name:, trait:, variant:, writer_class: nil)
        ClassMethod.(name: name, trait: trait, variant: variant, writer_class: writer_class)
        Activate.(name: name, trait: trait, variant: variant, writer_class: writer_class)
        Reset.(name: name, trait: trait, writer_class: writer_class)
        Text.(name: name, trait: trait, variant: variant, writer_class: writer_class)
        Text::Newline.(name: name, trait: trait, variant: variant, writer_class: writer_class)
        Block.(name: name, trait: trait, variant: variant, writer_class: writer_class)
      end

      def self.included(cls)
        cls.class_exec do
          extend Build
          extend Call
        end
      end

      def writer_class
        @writer_class ||= TerminalOutput::Styling::Writer
      end
      attr_writer :writer_class

      attr_reader :trait_name
      attr_reader :control_trait
      attr_reader :variant

      def initialize(trait_name, control_trait, variant)
        @trait_name = trait_name
        @control_trait = control_trait
        @variant = variant
      end

      module Build
        def build(name:, trait:, variant:, writer_class: nil)
          instance = new(name, trait, variant)
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
