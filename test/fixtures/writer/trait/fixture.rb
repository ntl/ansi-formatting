module Fixtures
  module Writer
    class Trait
      module Fixture
        def self.included(cls)
          cls.class_exec do
            include TestBench::Fixture

            extend Build
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
      end
    end
  end
end
