require_relative '../../automated_init'

context "Writer" do
  context "Style Macro" do
    control_style = Controls::Style.example

    writer_class = Controls::Writer.example_class do
      style(:some_style, control_style)
    end

    fixture(
      Fixtures::Writer::Style,
      writer_class: writer_class,
      name: :some_style,
      style: control_style
    )
  end
end
