module Fixtures
  module Writer
    module Trait
      class Text
        include TestBench::Bootstrap::Fixture
        include Trait

        def call(prose=nil)
          context prose do
            context "Optional Variant Given" do
              variant_style = control_trait.style(variant)

              Style::Text.(style: variant_style, writer_class: writer_class) do |writer, text|
                writer.public_send(trait_name, variant, text)
              end
            end

            context "Optional Variant Omitted" do
              default_style = control_trait.style

              Style::Text.(style: default_style, writer_class: writer_class) do |writer, text|
                writer.public_send(trait_name, text)
              end
            end
          end
        end

        class Newline < Text
          def call(prose=nil)
            context prose do
              context "Optional Variant Given" do
                variant_style = control_trait.style(variant)

                Style::Text::Newline.(style: variant_style, writer_class: writer_class) do |writer, text|
                  writer.public_send(:"#{trait_name}!", variant, text)
                end
              end

              context "Optional Variant Omitted" do
                default_style = control_trait.style

                Style::Text::Newline.(style: default_style, writer_class: writer_class) do |writer, text|
                  writer.public_send(:"#{trait_name}!", text)
                end
              end
            end
          end
        end
      end
    end
  end
end
