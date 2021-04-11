module Fixtures
  class Trait
    include TestBench::Fixture

    attr_reader :trait
    attr_reader :variant
    attr_reader :control_code
    attr_reader :default_code
    attr_reader :control_reset_code

    def initialize(trait, variant, control_code, default_code, control_reset_code)
      @trait = trait
      @variant = variant
      @control_code = control_code
      @default_code = default_code
      @control_reset_code = control_reset_code
    end

    def self.build(trait, variant:, code:, reset_code:, default_code: nil)
      default_code ||= trait.default_code

      new(trait, variant, code, default_code, reset_code)
    end

    def call
      context "Variant: #{variant.inspect}" do
        context "Variant Predicate" do
          test "Returns true" do
            assert(trait.variant?(variant))
          end
        end

        context "Get Code" do
          code = trait.get(variant)

          test do
            comment "Sample: [\e[#{control_code}mControl\e[0m, \e[#{code}mActual\e[0m]"

            assert(code == control_code)
          end
        end

        context "Fetch Code" do
          code = trait.fetch(variant)

          test do
            comment "Sample: [\e[#{control_code}mControl\e[0m, \e[#{code}mActual\e[0m]"

            assert(code == control_code)
          end
        end

        context "Get Style" do
          context "Optional Variant Argument Given" do
            style = trait.style(variant)

            test do
              control_style = TerminalOutput::Styling::Style.new(control_code, control_reset_code)

              assert(style == control_style)
            end
          end

          context "Optional Variant Argument Omitted" do
            style = trait.style

            test "Style uses default code of trait" do
              control_style = TerminalOutput::Styling::Style.new(default_code, control_reset_code)

              assert(style == control_style)
            end
          end
        end

        context "Get Reset Code" do
          reset_code = trait.reset_code

          test do
            comment "Sample: [\e[#{control_code}mControl\e[#{control_reset_code}m, \e[#{control_code}mActual\e[#{reset_code}m]"

            assert(reset_code == control_reset_code)
          end
        end
      end
    end
  end
end
