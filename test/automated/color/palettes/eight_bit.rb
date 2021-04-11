require_relative '../../automated_init'

context "Color" do
  context "Palettes" do
    context "Eight Bit" do
      context "Standard Color" do
        color_id = Controls::Color::EightBit::Standard::ID.example

        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::EightBit,
          color_id: color_id,
          foreground: Controls::Color::EightBit::Standard::Foreground.code(color_id),
          background: Controls::Color::EightBit::Standard::Background.code(color_id)
        )
      end

      context "High Intensity Color" do
        color_id = Controls::Color::EightBit::HighIntensity::ID.example

        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::EightBit,
          color_id: color_id,
          foreground: Controls::Color::EightBit::HighIntensity::Foreground.code(color_id),
          background: Controls::Color::EightBit::HighIntensity::Background.code(color_id)
        )
      end

      context "RGB Color" do
        color_id = Controls::Color::EightBit::RGB::ID.example

        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::EightBit,
          color_id: color_id,
          foreground: Controls::Color::EightBit::RGB::Foreground.code(color_id),
          background: Controls::Color::EightBit::RGB::Background.code(color_id)
        )
      end

      context "Greyscale Color" do
        color_id = Controls::Color::EightBit::Greyscale::ID.example

        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::EightBit,
          color_id: color_id,
          foreground: Controls::Color::EightBit::Greyscale::Foreground.code(color_id),
          background: Controls::Color::EightBit::Greyscale::Background.code(color_id)
        )
      end

      context "Unknown Color: :unknown" do
        fixture(
          Fixtures::Color::Palette::Color::Unknown,
          Color::Palette::Standard,
          :unknown
        )
      end
    end
  end
end
