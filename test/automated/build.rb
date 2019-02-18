require_relative './automated_init'

context "Build" do
  text = Controls::Text.example
  code = Controls::SGR::Code.example

  string = Build.() do
    text(text)
    code(code)
  end

  test "Evaluates block and returns string" do
    assert(string == "#{text}\e[#{code}m")
  end
end
