require_relative '../../automated_init'

context "Writer" do
  context "Style" do
    context "Newline Variant" do
      style = Controls::Style.example

      Fixtures::Writer::Style::Text::Newline.(style: style) do |writer, text|
        writer.style!(style, text)
      end
    end
  end
end
