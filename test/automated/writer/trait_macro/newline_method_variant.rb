require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Newline Method Variant" do
      trait = Controls::Trait.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait)
      end

      trait_variant = Controls::Trait::Variant.example

      fixture(
        Fixtures::Writer::Trait::Text::Newline,
        name: :some_trait,
        trait: trait,
        variant: trait_variant,
        writer_class: writer_class
      )
    end
  end
end
