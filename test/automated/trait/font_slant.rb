require_relative '../automated_init'

context "Trait" do
  context "Font Slant" do
    trait = Trait::Font::Slant

    Controls::Trait::Font::Slant::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Font::Slant::Code.example(variant),
        reset_code: Controls::Trait::Font::Slant::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
