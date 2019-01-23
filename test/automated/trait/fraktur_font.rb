require_relative '../automated_init'

context "Trait" do
  context "Farktur (Gothic) Font" do
    trait = Trait::Font::Fraktur

    Controls::Trait::Font::Fraktur::Variant.list.each do |variant|
      Fixtures::Trait.(
        trait,
        variant: variant,
        code: Controls::Trait::Font::Fraktur::Code.example(variant),
        reset_code: Controls::Trait::Font::Fraktur::Code.reset
      )
    end

    Fixtures::Trait::Unknown.(trait)
  end
end
