require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Eight Bit" do
      context "Greyscale" do
        Controls::Color::EightBit::Greyscale::ID.list.each do |color_id|
          context "Color: #{color_id.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color,
              Color::Palette::EightBit::Greyscale,
              color_id: color_id,
              foreground: Controls::Color::EightBit::Greyscale::Foreground.code(color_id),
              background: Controls::Color::EightBit::Greyscale::Background.code(color_id)
            )
          end
        end

        [:unknown, :grey_0, :gray_0, :grey_25, :gray_25].each do |incorrect|
          context "Unknown Color: #{incorrect.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color::Unknown,
              Color::Palette::EightBit::Greyscale,
              incorrect
            )
          end
        end

        context "Caching" do
          fixture(
            Fixtures::Color::Palette::Caching,
            Color::Palette::EightBit::Greyscale,
            Controls::Color::EightBit::Greyscale::ID.example
          )
        end
      end
    end
  end
end
