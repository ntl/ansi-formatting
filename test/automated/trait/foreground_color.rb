require_relative '../automated_init'

context "Trait" do
  context "Foreground Color" do
    trait = Trait::Color::Foreground

    color_id = Controls::Trait::Color::Foreground::Variant.example

    Fixtures::Trait.(
      trait,
      variant: color_id,
      code: Controls::Trait::Color::Foreground::Code.example(color_id),
      reset_code: Controls::Trait::Color::Foreground::Code.reset
    )

    Fixtures::Trait::Unknown.(trait)
  end
end
