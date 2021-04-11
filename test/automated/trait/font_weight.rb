require_relative '../automated_init'

context "Trait" do
  context "Font Weight" do
    trait = Trait::Font::Weight

    Controls::Trait::Font::Weight::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Font::Weight::Code.example(variant),
        reset_code: Controls::Trait::Font::Weight::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
