require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Transparent Foreground" do
      trait = Trait::Color::Foreground::Transparent

      variant = Controls::Trait::Color::Foreground::Transparent::Variant.example

      Fixtures::Writer::Trait.(
        name: :transparent_foreground,
        trait: trait,
        variant: variant
      )

      Fixtures::Writer::Trait.(
        name: :transparent,
        trait: trait,
        variant: variant
      )
    end
  end
end
