module Fixtures
  module Writer
    class Trait
      class ClassMethod
        include Fixture

        def call(prose=nil)
          context prose do
            context "Optional Variant Given" do
              style = writer_class.public_send(trait_name, variant)

              test "Resolves style corresponding to the variant" do
                control_style = control_trait.style(variant)

                assert(style == control_style)
              end
            end

            context "Optional Variant Omitted" do
              style = writer_class.public_send(trait_name)

              test "Resolves style corresponding to the trait's default variant" do
                assert(style == control_trait.style)
              end
            end
          end
        end
      end
    end
  end
end
