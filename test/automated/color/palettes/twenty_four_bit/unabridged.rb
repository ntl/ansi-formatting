require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Twenty Four Bit" do
      context "Unabridged" do
        list = Controls::Color::TwentyFourBit::Unabridged::ID.list(gradient_steps: :minimum)

        list.each do |color_id|
          context "Color: #{color_id.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color,
              Color::Palette::TwentyFourBit::Unabridged,
              color_id: color_id,
              foreground: Controls::Color::TwentyFourBit::Unabridged::Foreground.code(color_id),
              background: Controls::Color::TwentyFourBit::Unabridged::Background.code(color_id)
            )
          end
        end

        [0x111111, '#111', '111111', '0x1111111', '0x11111', '#11111', '#1111111'].each do |incorrect|
          context "Unknown Color: #{incorrect.inspect}" do
            fixture(
              Fixtures::Color::Palette::Color::Unknown,
              Color::Palette::TwentyFourBit::Unabridged,
              incorrect
            )
          end
        end

        context "Caching" do
          fixture(
            Fixtures::Color::Palette::Caching::None,
            Color::Palette::TwentyFourBit::Unabridged,
            Controls::Color::TwentyFourBit::Unabridged::ID.example
          )
        end
      end
    end
  end
end
