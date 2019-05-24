require_relative '../../automated_init'

context "Writer" do
  context "Style" do
    context "Reset" do
      style = Controls::Style.example

      Fixtures::Writer::Style::Reset.(style: style) do |writer|
        writer.reset_style(style)
      end
    end
  end
end
