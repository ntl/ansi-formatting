require_relative '../automated_init'

context "Color" do
  context "Standard Color" do
    color_id = Controls::Color::Standard::ID.example

    fixture(
      Fixtures::Color::Palette::Color,
      Color,
      color_id: color_id,
      foreground: Controls::Color::Standard::Foreground.code,
      background: Controls::Color::Standard::Background.code
    )
  end

  context "High Intensity Color" do
    color_id = Controls::Color::HighIntensity::ID.example

    fixture(
      Fixtures::Color::Palette::Color,
      Color,
      color_id: color_id,
      foreground: Controls::Color::HighIntensity::Foreground.code,
      background: Controls::Color::HighIntensity::Background.code
    )
  end

  context "Eight Bit Color" do
    color_id = Controls::Color::EightBit::ID.example

    fixture(
      Fixtures::Color::Palette::Color,
      Color,
      color_id: color_id,
      foreground: Controls::Color::EightBit::Foreground.code,
      background: Controls::Color::EightBit::Background.code
    )
  end

  context "Twenty Four Bit Color" do
    color_id = Controls::Color::TwentyFourBit::ID.example

    fixture(
      Fixtures::Color::Palette::Color,
      Color,
      color_id: color_id,
      foreground: Controls::Color::TwentyFourBit::Foreground.code,
      background: Controls::Color::TwentyFourBit::Background.code
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
