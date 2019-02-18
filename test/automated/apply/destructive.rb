require_relative '../automated_init'

context "Apply" do
  context "Destructive" do
    context do
      string = String.new('Some string')

      return_value = Apply.!(string, fg: :white, bg: :black, style: :underline, styles: [:bold, :italic])

      test "Modifies given string" do
        assert(string == "\e[37;40;1;3;4mSome string\e[39;49;22;23;24m")
      end

      test "Returns string before modification" do
        assert(return_value == 'Some string')
      end
    end

    context "String Is Not Modified" do
      string = String.new('Some string')

      return_value = Apply.!(string)

      test "Given string is not modified" do
        assert(string == 'Some string')
      end

      test "Returns nil" do
        assert(return_value.nil?)
      end
    end

    context "String Is Frozen" do
      string = 'Some string'.freeze

      begin
        Apply.!(string)
      rescue FrozenError => error
      end

      test "Raises error" do
        refute(error.nil?)
      end
    end
  end
end
