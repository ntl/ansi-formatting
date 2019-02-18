require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Reset Method" do
      trait = Controls::Trait.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait)
      end

      Fixtures::Writer::Trait::Reset.(
        name: :some_trait,
        trait: trait,
        writer_class: writer_class
      )
    end
  end
end
