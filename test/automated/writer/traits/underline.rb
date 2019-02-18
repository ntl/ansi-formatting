require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Underline" do
      trait = Trait::Underline

      variant = Controls::Trait::Underline::Variant.example

      Fixtures::Writer::Trait.(
        name: :underline,
        trait: trait,
        variant: variant
      )
    end
  end
end
