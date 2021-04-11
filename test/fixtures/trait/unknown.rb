module Fixtures
  class Trait
    class Unknown
      include TestBench::Fixture

      attr_reader :trait
      attr_reader :variant

      def initialize(trait, variant)
        @trait = trait
        @variant = variant
      end

      def self.build(trait, variant: nil)
        variant ||= Defaults.variant

        new(trait, variant)
      end

      def call
        context "Unknown Variant: #{variant.inspect}" do
          context "Variant Predicate" do
            test "Returns false" do
              refute(trait.variant?(variant))
            end
          end

          context "Get Code" do
            code = trait.get(variant)

            test "Returns nothing" do
              assert(code.nil?)
            end
          end

          context "Fetch Code" do
            begin
              trait.fetch(variant)
            rescue TerminalOutput::Styling::Trait::Error => error
            end

            test "Raises error" do
              refute(error.nil?)
            end
          end
        end
      end

      module Defaults
        def self.variant
          :unknown
        end
      end
    end
  end
end
