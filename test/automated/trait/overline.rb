require_relative '../automated_init'

context "Trait" do
  context "Overline" do
    trait = Trait::Overline

    Controls::Trait::Overline::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Overline::Code.example(variant),
        reset_code: Controls::Trait::Overline::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
