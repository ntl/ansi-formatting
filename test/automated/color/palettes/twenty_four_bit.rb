require_relative '../../automated_init'

context "Color" do
  context "Palettes" do
    context "Twenty Four Bit" do
      context "Unabridged" do
        color_id = Controls::Color::TwentyFourBit::Unabridged::ID.example

        Fixtures::Color::Palette::Color.(
          Color::Palette::TwentyFourBit,
          color_id: color_id,
          foreground: Controls::Color::TwentyFourBit::Unabridged::Foreground.code(color_id),
          background: Controls::Color::TwentyFourBit::Unabridged::Background.code(color_id)
        )
      end

      context "Abridged" do
        color_id = Controls::Color::TwentyFourBit::Abridged::ID.example

        Fixtures::Color::Palette::Color.(
          Color::Palette::TwentyFourBit,
          color_id: color_id,
          foreground: Controls::Color::TwentyFourBit::Abridged::Foreground.code(color_id),
          background: Controls::Color::TwentyFourBit::Abridged::Background.code(color_id)
        )
      end
    end
  end
end
