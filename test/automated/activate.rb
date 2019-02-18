require_relative './automated_init'

context "Activate" do
  target_class = Class.new(String)

  TerminalOutput::Styling.activate(target_class)

  context "Style Class Method" do
    text = Controls::Text.example
    code = Controls::SGR::Code.example

    string = target_class.style do
      text(text)
      code(code)
    end

    test "Evaluates block and returns instance" do
      assert(string == "#{text}\e[#{code}m")
    end
  end

  context "Style Instance Method" do
    control_string = "\e[37;40;1;3;4mSome string\e[39;49;22;23;24m"

    context "Non-Destructive" do
      input_string = target_class.new('Some string')

      output_string = input_string.style(fg: :white, bg: :black, style: :underline, styles: [:bold, :italic])

      test "Returns string with styling applied" do
        assert(output_string == control_string)
      end

      test "Does not modify input string" do
        assert(input_string == 'Some string')
      end
    end

    context "Destructive" do
      input_string = target_class.new('Some string')

      output_string = input_string.style!(fg: :white, bg: :black, style: :underline, styles: [:bold, :italic])

      test "Modifes the string" do
        assert(input_string == control_string)
      end

      test "Returns string before modification" do
        assert(output_string == 'Some string')
      end
    end
  end
end
