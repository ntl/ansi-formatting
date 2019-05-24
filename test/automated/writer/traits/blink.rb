require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Blink" do
      trait = Trait::Blink

      variant = Controls::Trait::Blink::Variant.example

      Fixtures::Writer::Trait.(
        name: :blink,
        trait: trait,
        variant: variant
      )
    end
  end
end
