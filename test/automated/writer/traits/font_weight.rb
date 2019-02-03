require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Font Weight" do
      trait = Trait::Font::Weight

      variant = Controls::Trait::Font::Weight::Variant.example

      Fixtures::Writer::Trait.(
        name: :font_weight,
        trait: trait,
        variant: variant
      )
    end
  end
end
