require_relative '../automated_init'

context "Trait" do
  context "Reverse Video" do
    trait = Trait::Color::ReverseVideo

    Controls::Trait::Color::ReverseVideo::Variant.list.each do |variant|
      Fixtures::Trait.(
        trait,
        variant: variant,
        code: Controls::Trait::Color::ReverseVideo::Code.example(variant),
        reset_code: Controls::Trait::Color::ReverseVideo::Code.reset
      )
    end

    Fixtures::Trait::Unknown.(trait)
  end
end
