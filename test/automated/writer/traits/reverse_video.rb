require_relative '../../automated_init'

context "Writer" do
  context "Traits" do
    context "Reverse Video" do
      trait = Trait::Color::ReverseVideo

      variant = Controls::Trait::Color::ReverseVideo::Variant.example

      Fixtures::Writer::Trait.(
        name: :reverse_video,
        trait: trait,
        variant: variant
      )
    end
  end
end
