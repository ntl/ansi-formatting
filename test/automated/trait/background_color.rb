require_relative '../automated_init'

context "Trait" do
  context "Background Color" do
    trait = Trait::Color::Background

    color_id = Controls::Trait::Color::Background::Variant.example

    fixture(
      Fixtures::Trait,
      trait,
      variant: color_id,
      code: Controls::Trait::Color::Background::Code.example(color_id),
      reset_code: Controls::Trait::Color::Background::Code.reset
    )

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
