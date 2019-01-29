require_relative '../automated_init'

context "Style" do
  context "Strict Combination" do
    style_1 = Controls::Style.example

    context "Both Codes And Reset Codes Differ" do
      style_2 = Controls::Style.alternate

      style = style_1 + style_2

      test "Combines the codes of both styles" do
        assert(style.code == "#{style_1.code};#{style_2.code}")
      end

      test "Combines the reset codes of both styles" do
        assert(style.reset_code == "#{style_1.reset_code};#{style_2.reset_code}")
      end
    end

    context "Codes Do Not Differ" do
      style_2 = Controls::Style.alternate(code: style_1.code)
      refute(style_1 == style_2)

      begin
        style_1 + style_2
      rescue Style::Error => error
      end

      test "Raises error" do
        refute(error.nil?)
      end
    end

    context "Reset Codes Do Not Differ" do
      style_2 = Controls::Style.alternate(reset_code: style_1.reset_code)
      refute(style_1 == style_2)

      begin
        style_1 + style_2
      rescue Style::Error => error
      end

      test "Raises error" do
        refute(error.nil?)
      end
    end
  end
end
