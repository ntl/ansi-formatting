require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Background Color" do
      trait = Trait::Color::Background

      variant = Controls::Trait::Color::Background::Variant.example

      fixture(
        Fixtures::Writer::Trait,
        name: :background_color,
        trait: trait,
        variant: variant
      )
    end
  end
end
