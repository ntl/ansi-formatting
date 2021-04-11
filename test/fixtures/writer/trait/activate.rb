module Fixtures
  module Writer
    class Trait
      class Activate
        include Fixture

        def call(prose=nil)
          context prose do
            context "Optional Variant Given" do
              variant_style = control_trait.style(variant)

              fixture(
                Style::Activate,
                style: variant_style,
                writer_class: writer_class
              ) do |writer|
                writer.public_send(trait_name, variant)
              end
            end

            context "Optional Variant Omitted" do
              default_style = control_trait.style

              fixture(
                Style::Activate,
                style: default_style,
                writer_class: writer_class
              ) do |writer|
                writer.public_send(trait_name)
              end
            end
          end
        end
      end
    end
  end
end
