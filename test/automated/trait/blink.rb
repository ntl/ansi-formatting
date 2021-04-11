require_relative '../automated_init'

context "Trait" do
  context "Blink" do
    trait = Trait::Blink

    Controls::Trait::Blink::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Blink::Code.example(variant),
        reset_code: Controls::Trait::Blink::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
