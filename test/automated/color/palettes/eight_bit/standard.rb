require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Eight Bit" do
      context "Standard" do
        Controls::Color::EightBit::Standard::ID.list.each do |color_id|
          context "Color: #{color_id.inspect}" do
            Fixtures::Color::Palette::Color.(
              Color::Palette::EightBit::Standard,
              color_id: color_id,
              foreground: Controls::Color::EightBit::Standard::Foreground.code(color_id),
              background: Controls::Color::EightBit::Standard::Background.code(color_id)
            )
          end
        end

        context "Alias: :text_bg_8bit" do
          Fixtures::Color::Palette::Color.(
            Color::Palette::EightBit::Standard,
            color_id: :text_bg_8bit,
            foreground: Controls::Color::EightBit::Standard::Foreground.code(:black_8bit),
            background: Controls::Color::EightBit::Standard::Background.code(:black_8bit)
          )
        end

        context "Alias: :text_fg_8bit" do
          Fixtures::Color::Palette::Color.(
            Color::Palette::EightBit::Standard,
            color_id: :text_fg_8bit,
            foreground: Controls::Color::EightBit::Standard::Foreground.code(:white_8bit),
            background: Controls::Color::EightBit::Standard::Background.code(:white_8bit)
          )
        end

        [:unknown, :unknown_8bit].each do |incorrect|
          context "Unknown Color: #{incorrect.inspect}" do
            Fixtures::Color::Palette::Color::Unknown.(
              Color::Palette::EightBit::Standard,
              incorrect
            )
          end
        end

        context "Caching" do
          Fixtures::Color::Palette::Caching.(
            Color::Palette::EightBit::Standard,
            Controls::Color::EightBit::Standard::ID.example
          )
        end
      end
    end
  end
end
