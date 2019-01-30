require_relative '../automated_init'

context "Writer" do
  context "Style" do
    style = Controls::Style.example

    Fixtures::Writer::Style.(
      style: style,
      activate: proc { |writer, text=nil, &block|
        writer.style(style, text, &block)
      },
      reset: proc { |writer|
        writer.reset_style(style)
      }
    )
  end
end
