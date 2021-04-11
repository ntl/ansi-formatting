require_relative '../automated_init'

context "Trait" do
  context "Underline" do
    trait = Trait::Underline

    Controls::Trait::Underline::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Underline::Code.example(variant),
        reset_code: Controls::Trait::Underline::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
