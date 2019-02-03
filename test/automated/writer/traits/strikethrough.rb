require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Strikethrough" do
      trait = Trait::Strikethrough

      variant = Controls::Trait::Strikethrough::Variant.example

      Fixtures::Writer::Trait.(
        name: :strikethrough,
        trait: trait,
        variant: variant
      )
    end
  end
end
