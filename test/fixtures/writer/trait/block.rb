module Fixtures
  module Writer
    class Trait
      class Block
        include Fixture

        def call(prose=nil)
          context prose do
            context "Optional Variant Given" do
              variant_style = control_trait.style(variant)

              fixture(
                Style::Block,
                style: variant_style,
                writer_class: writer_class
              ) do |writer, &block|
                writer.public_send(trait_name, variant, &block)
              end
            end

            context "Optional Variant Omitted" do
              default_style = control_trait.style

              fixture(
                Style::Block,
                style: default_style,
                writer_class: writer_class
              ) do |writer, &block|
                writer.public_send(trait_name, &block)
              end
            end
          end
        end
      end
    end
  end
end
