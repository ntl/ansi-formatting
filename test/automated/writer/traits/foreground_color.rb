require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Foreground Color" do
      trait = Trait::Color::Foreground

      variant = Controls::Trait::Color::Foreground::Variant.example

      Fixtures::Writer::Trait.(
        name: :foreground_color,
        trait: trait,
        variant: variant
      )

      Fixtures::Writer::Trait.(
        name: :fg,
        trait: trait,
        variant: variant
      )
    end
  end
end
