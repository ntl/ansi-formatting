require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    trait = Controls::Trait.example

    variant = Controls::Trait::Variant.example

    writer_class = Controls::Writer.example_class do
      trait(:some_trait, trait)
    end

    Fixtures::Writer::Trait.(
      writer_class: writer_class,
      name: :some_trait,
      trait: trait,
      variant: variant
    )
  end
end
