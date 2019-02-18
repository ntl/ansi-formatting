module Fixtures
  module Writer
    module Trait
      class Block
        include TestBench::Bootstrap::Fixture
        include Trait

        def call(prose=nil)
          context prose do
            context "Optional Variant Given" do
              variant_style = control_trait.style(variant)

              Style::Block.(style: variant_style, writer_class: writer_class) do |writer, &block|
                writer.public_send(trait_name, variant, &block)
              end
            end

            context "Optional Variant Omitted" do
              default_style = control_trait.style

              Style::Block.(style: default_style, writer_class: writer_class) do |writer, &block|
                writer.public_send(trait_name, &block)
              end
            end
          end
        end
      end
    end
  end
end
