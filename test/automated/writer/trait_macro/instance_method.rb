require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Instance Method" do
      trait = Controls::Trait.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait)
      end

      variant = Controls::Trait::Variant.example

      context "Activate" do
        fixture(
          Fixtures::Writer::Trait::Activate,
          name: :some_trait,
          trait: trait,
          variant: variant,
          writer_class: writer_class
        )
      end

      context "Block" do
        fixture(
          Fixtures::Writer::Trait::Block,
          name: :some_trait,
          trait: trait,
          variant: variant,
          writer_class: writer_class
        )
      end

      context "Text" do
        fixture(
          Fixtures::Writer::Trait::Text,
          name: :some_trait,
          trait: trait,
          variant: variant,
          writer_class: writer_class
        )
      end
    end
  end
end
