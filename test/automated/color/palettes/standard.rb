require_relative '../../automated_init'

context "Color" do
  context "Palettes" do
    context "Standard" do
      Controls::Color::Standard::ID.list.each do |color_id|
        context "Color: #{color_id.inspect}" do
          Fixtures::Color::Palette::Color.(
            Color::Palette::Standard,
            color_id: color_id,
            foreground: Controls::Color::Standard::Foreground.code(color_id),
            background: Controls::Color::Standard::Background.code(color_id)
          )
        end
      end

      context "Alias: :text_bg" do
        Fixtures::Color::Palette::Color.(
          Color::Palette::Standard,
          color_id: :text_bg,
          foreground: Controls::Color::Standard::Foreground.code(:black),
          background: Controls::Color::Standard::Background.code(:black)
        )
      end

      context "Alias: :text_fg" do
        Fixtures::Color::Palette::Color.(
          Color::Palette::Standard,
          color_id: :text_fg,
          foreground: Controls::Color::Standard::Foreground.code(:white),
          background: Controls::Color::Standard::Background.code(:white)
        )
      end

      context "Unknown Color: :unknown" do
        Fixtures::Color::Palette::Color::Unknown.(
          Color::Palette::Standard,
          :unknown
        )
      end

      context "Caching" do
        Fixtures::Color::Palette::Caching.(
          Color::Palette::Standard,
          Controls::Color::Standard::ID.example
        )
      end
    end
  end
end
