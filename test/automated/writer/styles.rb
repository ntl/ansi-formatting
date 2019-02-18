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
  end
end
