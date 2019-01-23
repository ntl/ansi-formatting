require_relative '../automated_init'

context "Trait" do
  context "Font Intensity" do
    trait = Trait::Font::Intensity

    Controls::Trait::Font::Intensity::Variant.list.each do |variant|
      Fixtures::Trait.(
        trait,
        variant: variant,
        code: Controls::Trait::Font::Intensity::Code.example(variant),
        reset_code: Controls::Trait::Font::Intensity::Code.reset
      )
    end

    Fixtures::Trait::Unknown.(trait)
  end
end
