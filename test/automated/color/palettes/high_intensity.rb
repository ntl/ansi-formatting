require_relative '../../automated_init'

context "Color" do
  context "Palettes" do
    context "High Intensity" do
      Controls::Color::HighIntensity::ID.list.each do |color_id|
        context "Color: #{color_id.inspect}" do
          fixture(
            Fixtures::Color::Palette::Color,
            Color::Palette::HighIntensity,
            color_id: color_id,
            foreground: Controls::Color::HighIntensity::Foreground.code(color_id),
            background: Controls::Color::HighIntensity::Background.code(color_id)
          )
        end
      end

      context "Alias: :intense_text_bg" do
        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::HighIntensity,
          color_id: :intense_text_bg,
          foreground: Controls::Color::HighIntensity::Foreground.code(:intense_black),
          background: Controls::Color::HighIntensity::Background.code(:intense_black)
        )
      end

      context "Alias: :intense_text_fg" do
        fixture(
          Fixtures::Color::Palette::Color,
          Color::Palette::HighIntensity,
          color_id: :intense_text_fg,
          foreground: Controls::Color::HighIntensity::Foreground.code(:intense_white),
          background: Controls::Color::HighIntensity::Background.code(:intense_white)
        )
      end

      context "Unknown Color: :unknown" do
        fixture(
          Fixtures::Color::Palette::Color::Unknown,
          Color::Palette::HighIntensity,
          :unknown
        )
      end

      context "Caching" do
        fixture(
          Fixtures::Color::Palette::Caching,
          Color::Palette::HighIntensity,
          Controls::Color::HighIntensity::ID.example
        )
      end
    end
  end
end
