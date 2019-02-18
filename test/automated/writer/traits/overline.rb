require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Overline" do
      trait = Trait::Overline

      variant = Controls::Trait::Overline::Variant.example

      Fixtures::Writer::Trait.(
        name: :overline,
        trait: trait,
        variant: variant
      )
    end
  end
end
