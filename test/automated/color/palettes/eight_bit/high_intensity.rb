require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Eight Bit" do
      context "High Intensity" do
        Controls::Color::EightBit::HighIntensity::ID.list.each do |color_id|
          context "Color: #{color_id.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color,
              Color::Palette::EightBit::HighIntensity,
              color_id: color_id,
              foreground: Controls::Color::EightBit::HighIntensity::Foreground.code(color_id),
              background: Controls::Color::EightBit::HighIntensity::Background.code(color_id)
            )
          end
        end

        context "Alias: :intense_text_bg_8bit" do
          fixture(
            Fixtures::Color::Palette::Color,
            Color::Palette::EightBit::HighIntensity,
            color_id: :intense_text_bg_8bit,
            foreground: Controls::Color::EightBit::HighIntensity::Foreground.code(:intense_black_8bit),
            background: Controls::Color::EightBit::HighIntensity::Background.code(:intense_black_8bit)
          )
        end

        context "Alias: :intense_text_fg_8bit" do
          fixture(
            Fixtures::Color::Palette::Color,
            Color::Palette::EightBit::HighIntensity,
            color_id: :intense_text_fg_8bit,
            foreground: Controls::Color::EightBit::HighIntensity::Foreground.code(:intense_white_8bit),
            background: Controls::Color::EightBit::HighIntensity::Background.code(:intense_white_8bit)
          )
        end

        [:unknown, :unknown_8bit, :intense_unknown_8bit].each do |incorrect|
          context "Unknown Color: #{incorrect.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color::Unknown,
              Color::Palette::EightBit::HighIntensity,
              incorrect
            )
          end
        end

        context "Caching" do
          fixture(
            Fixtures::Color::Palette::Caching,
            Color::Palette::EightBit::HighIntensity,
            Controls::Color::EightBit::HighIntensity::ID.example
          )
        end
      end
    end
  end
end
