require_relative '../automated_init'

context "Trait" do
  context "Strikethrough" do
    trait = Trait::Strikethrough

    Controls::Trait::Strikethrough::Variant.list.each do |variant|
      fixture(
        Fixtures::Trait,
        trait,
        variant: variant,
        code: Controls::Trait::Strikethrough::Code.example(variant),
        reset_code: Controls::Trait::Strikethrough::Code.reset
      )
    end

    fixture(
      Fixtures::Trait::Unknown,
      trait
    )
  end
end
