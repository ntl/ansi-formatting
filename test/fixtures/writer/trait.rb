module Fixtures
  class Writer
    class Trait
      include TestBench::Bootstrap::Fixture

      attr_reader :writer_class
      attr_reader :trait_name
      attr_reader :trait
      attr_reader :variant

      def initialize(writer_class, trait_name, trait, variant)
        @writer_class = writer_class
        @trait_name = trait_name
        @trait = trait
        @variant = variant
      end

      def self.call(writer_class: nil, name:, trait:, variant:)
        writer_class ||= TerminalOutput::Styling::Write

        instance = new(writer_class, name, trait, variant)
        instance.()
      end

      def call
        context "Class Method" do
          context "Optional Variant Argument Given" do
            style = writer_class.public_send(trait_name, variant)

            test "Resolves the style corresponding to given variant" do
              control_style = trait.style(variant)

              assert(style == control_style)
            end
          end

          context "Optional Variant Argument Omitted" do
            style = writer_class.public_send(trait_name)

            test "Resolves the style corresponding to trait's default variant" do
              control_style = trait.style

              assert(style == control_style)
            end
          end
        end

        context "Instance Methods" do
          context "Optional Variant Argument Given" do
            Style::Activate.(
              writer_class: writer_class,
              style: trait.style(variant),
              activate: proc { |writer, text=nil, &block|
                writer.public_send(trait_name, variant, text, &block)
              }
            )
          end

          context "Optional Variant Argument Omitted" do
            Style::Activate.(
              writer_class: writer_class,
              style: trait.style,
              activate: proc { |writer, text=nil, &block|
                writer.public_send(trait_name, text, &block)
              }
            )
          end

          Style::Reset.(
            writer_class: writer_class,
            style: trait.style(variant),
            reset: proc { |writer, text=nil, &block|
              writer.public_send(:"reset_#{trait_name}")
            }
          )
        end
      end
    end
  end
end
