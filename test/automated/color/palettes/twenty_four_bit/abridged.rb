require_relative '../../../automated_init'

context "Color" do
  context "Palettes" do
    context "Twenty Four Bit" do
      context "Abridged" do
        list = Controls::Color::TwentyFourBit::Abridged::ID.list(gradient_steps: :minimum)

        list.each do |color_id|
          context "Color: #{color_id.inspect}" do
            Fixtures::Color::Palette::Color.(
              Color::Palette::TwentyFourBit::Abridged,
              color_id: color_id,
              foreground: Controls::Color::TwentyFourBit::Abridged::Foreground.code(color_id),
              background: Controls::Color::TwentyFourBit::Abridged::Background.code(color_id)
            )
          end
        end

        [0x111, '111', '0x111', '#1111', '#11'].each do |incorrect|
          context "Unknown Color: #{incorrect.inspect}" do
            Fixtures::Color::Palette::Color::Unknown.(
              Color::Palette::TwentyFourBit::Abridged,
              incorrect
            )
          end
        end

        context "Caching" do
          Fixtures::Color::Palette::Caching.(
            Color::Palette::TwentyFourBit::Abridged,
            Controls::Color::TwentyFourBit::Abridged::ID.example
          )
        end
      end
    end
  end
end
