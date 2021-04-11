require_relative '../automated_init'

context "Trait" do
  context "Transparent Foreground Color" do
    trait = Trait::Color::Foreground::Transparent

    Controls::Trait::Color::Foreground::Transparent::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Color::Foreground::Transparent::Code.example(variant),
        reset_code: Controls::Trait::Color::Foreground::Transparent::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
