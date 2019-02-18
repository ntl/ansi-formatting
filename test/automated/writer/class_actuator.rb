require_relative '../automated_init'

context "Writer" do
  context "Class Actuator" do
    io = StringIO.new

    text = Controls::Text.example
    code = Controls::SGR::Code.example

    return_value = Writer.(io, styling: true) do
      text(text)
      code(code)
    end

    test "Evaluates block writing to the given IO" do
      assert(io.string == "#{text}\e[#{code}m")
    end

    test "Returns the IO object that was passed in" do
      assert(return_value.equal?(io))
    end
  end
end
