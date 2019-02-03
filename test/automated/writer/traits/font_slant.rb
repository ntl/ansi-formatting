require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Font Slant" do
      trait = Trait::Font::Slant

      variant = Controls::Trait::Font::Slant::Variant.example

      Fixtures::Writer::Trait.(
        name: :font_slant,
        trait: trait,
        variant: variant
      )
    end
  end
end
