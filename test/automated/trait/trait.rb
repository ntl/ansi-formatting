require_relative '../automated_init'

context "Trait" do
  trait = Controls::Trait.example

  variant = Controls::Trait::Variant.example

  Fixtures::Trait.(
    trait,
    variant: variant,
    code: Controls::Trait::Code.example,
    reset_code: Controls::Trait::Code::Reset.example
  )

  Fixtures::Trait::Unknown.(trait)
end
