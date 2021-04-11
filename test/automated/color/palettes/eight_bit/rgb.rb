require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Eight Bit" do
      context "RGB" do
        color_ids = Controls::Color::EightBit::RGB::ID.list(gradient_steps: :minimum)

        color_ids.each do |color_id|
          context "Color: #{'%04o' % color_id}" do
            fixture(
              Fixtures::Color::Palette::Color,
              Color::Palette::EightBit::RGB,
              color_id: color_id,
              foreground: Controls::Color::EightBit::RGB::Foreground.code(color_id),
              background: Controls::Color::EightBit::RGB::Background.code(color_id)
            )
          end
        end

        [0006, 0060, 0600, 01000].each do |incorrect|
          context "Unknown Color: #{'%04o' % incorrect}" do
            fixture(
              Fixtures::Color::Palette::Color::Unknown,
              Color::Palette::EightBit::RGB,
              incorrect
            )
          end
        end

        ['0555', 1.1, -1].each do |incorrect|
          context "Unknown Color: #{incorrect}" do
            fixture(
              Fixtures::Color::Palette::Color::Unknown,
              Color::Palette::EightBit::RGB,
              incorrect
            )
          end
        end

        context "Caching" do
          fixture(
            Fixtures::Color::Palette::Caching,
            Color::Palette::EightBit::RGB,
            Controls::Color::EightBit::RGB::ID.example
          )
        end
      end
    end
  end
end
