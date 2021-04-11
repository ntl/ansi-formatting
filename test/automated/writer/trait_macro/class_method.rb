require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Class Method" do
      trait = Controls::Trait.example

      variant = Controls::Trait::Variant.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait)
      end

      fixture(
        Fixtures::Writer::Trait::ClassMethod,
        writer_class: writer_class,
        trait: trait,
        variant: variant,
        name: :some_trait
      )
    end
  end
end
