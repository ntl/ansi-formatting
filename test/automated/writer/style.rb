require_relative '../automated_init'

context "Writer" do
  context "Style" do
    style = Controls::Style.example

    Fixtures::Writer::Style::Activate.(style: style)

    Fixtures::Writer::Style::Reset.(style: style)
  end
end
