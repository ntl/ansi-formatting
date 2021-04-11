require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Fraktur Font" do
      trait = Trait::Font::Fraktur

      variant = Controls::Trait::Font::Fraktur::Variant.example

      fixture(
        Fixtures::Writer::Trait,
        name: :fraktur_font,
        trait: trait,
        variant: variant
      )
    end
  end
end
