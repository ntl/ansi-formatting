require_relative '../../automated_init'

context "Writer" do
  context "Style Macro" do
    context "Style Combination" do
      style_1 = Controls::Style.example
      style_2 = Controls::Style.alternate

      control_style = style_1 + style_2

      writer_class = Controls::Writer.example_class do
        style(:some_style, style_1, style_2)
      end

      fixture(
        Fixtures::Writer::Style,
        writer_class: writer_class,
        name: :some_style,
        style: control_style
      )
    end
  end
end
