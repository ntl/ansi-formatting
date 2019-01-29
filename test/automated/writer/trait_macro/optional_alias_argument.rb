require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Optional Alias Argument" do
      trait = Controls::Trait.example

      variant = Controls::Trait::Variant.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait, alias: :some_alias)
      end

      Fixtures::Writer::Trait.(
        writer_class: writer_class,
        name: :some_alias,
        trait: trait,
        variant: variant
      )
    end
  end
end
