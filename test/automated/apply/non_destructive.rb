require_relative '../automated_init'

context "Apply" do
  context "Non-Destructive" do
    input_string = 'Some string'

    output_string = Apply.(input_string, fg: :white, bg: :black, style: :underline, styles: [:bold, :italic])

    test "Returns string with styling applied" do
      assert(output_string == "\e[37;40;1;3;4mSome string\e[39;49;22;23;24m")
    end

    test "Does not modify input string" do
      assert(input_string == 'Some string')
    end
  end
end
