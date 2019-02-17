require_relative '../../automated_init'

context "Writer" do
  context "Style" do
    style = Controls::Style.example

    context "Activate" do
      Fixtures::Writer::Style::Activate.(style: style) do |writer|
        writer.style(style)
      end
    end

    context "Text" do
      Fixtures::Writer::Style::Text.(style: style) do |writer, text|
        writer.style(style, text)
      end
    end

    context "Block" do
      Fixtures::Writer::Style::Block.(style: style) do |writer, &block|
        writer.style(style, &block)
      end
    end
  end
end
