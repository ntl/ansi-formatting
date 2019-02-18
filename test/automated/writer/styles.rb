require_relative '../automated_init'

context "Writer" do
  context "Styles" do
    context "Bold" do
      style = Trait::Font::Weight.style(:bold)

      Fixtures::Writer::Style.(name: :bold, style: style)
    end

    context "Faint" do
      style = Trait::Font::Weight.style(:faint)

      Fixtures::Writer::Style.(name: :faint, style: style)
    end

    context "Italic" do
      style = Trait::Font::Slant.style(:italic)

      Fixtures::Writer::Style.(name: :italic, style: style)
    end

    context "Fraktur" do
      style = Trait::Font::Fraktur.style(:on)

      Fixtures::Writer::Style.(name: :fraktur, style: style)
    end

    context "Single Underline" do
      style = Trait::Underline.style(:single)

      Fixtures::Writer::Style.(name: :single_underline, style: style)
    end

    context "Double Underline" do
      style = Trait::Underline.style(:double)

      Fixtures::Writer::Style.(name: :double_underline, style: style)
    end

    context "Slow Blink" do
      style = Trait::Blink.style(:slow)

      Fixtures::Writer::Style.(name: :slow_blink, style: style)
    end

    context "Rapid Blink" do
      style = Trait::Blink.style(:rapid)

      Fixtures::Writer::Style.(name: :rapid_blink, style: style)
    end
  end
end
