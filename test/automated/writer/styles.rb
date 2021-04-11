require_relative '../automated_init'

context "Writer" do
  context "Styles" do
    context "Bold" do
      style = Trait::Font::Weight.style(:bold)

      fixture(
        Fixtures::Writer::Style,
        name: :bold,
        style: style
      )
    end

    context "Faint" do
      style = Trait::Font::Weight.style(:faint)

      fixture(
        Fixtures::Writer::Style,
        name: :faint,
        style: style
      )
    end

    context "Italic" do
      style = Trait::Font::Slant.style(:italic)

      fixture(
        Fixtures::Writer::Style,
        name: :italic,
        style: style
      )
    end

    context "Fraktur" do
      style = Trait::Font::Fraktur.style(:on)

      fixture(
        Fixtures::Writer::Style,
        name: :fraktur,
        style: style
      )
    end

    context "Single Underline" do
      style = Trait::Underline.style(:single)

      fixture(
        Fixtures::Writer::Style,
        name: :single_underline,
        style: style
      )
    end

    context "Double Underline" do
      style = Trait::Underline.style(:double)

      fixture(
        Fixtures::Writer::Style,
        name: :double_underline,
        style: style
      )
    end

    context "Slow Blink" do
      style = Trait::Blink.style(:slow)

      fixture(
        Fixtures::Writer::Style,
        name: :slow_blink,
        style: style
      )
    end

    context "Rapid Blink" do
      style = Trait::Blink.style(:rapid)

      fixture(
        Fixtures::Writer::Style,
        name: :rapid_blink,
        style: style
      )
    end

    color_ids = Controls::Color::Standard::ID.list +
      Controls::Color::HighIntensity::ID.list

    color_ids.each do |color_id|
      context "Color: #{color_id}" do
        context "Foreground" do
          style = Trait::Color::Foreground.style(color_id)

          fixture(
            Fixtures::Writer::Style,
            name: color_id,
            style: style
          )
        end
      end

      context "Color: #{color_id}" do
        context "Background" do
          style = Trait::Color::Background.style(color_id)

          fixture(
            Fixtures::Writer::Style,
            name: :"#{color_id}_bg",
            style: style
          )
        end
      end
    end
  end
end
