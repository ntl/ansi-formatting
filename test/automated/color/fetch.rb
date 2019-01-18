require_relative '../automated_init'

context "Color" do
  context "Fetch" do
    context "Known" do
      color_id = Controls::Color::ID.example

      color = Color.fetch(color_id)

      test "Returns the color that was fetched" do
        control_color = Controls::Color.example

        assert(color == control_color)
      end
    end

    context "Unknown" do
      color_id = :unknown

      begin
        Color.fetch(color_id)
      rescue Color::Error => error
      end

      test "Raises error" do
        refute(error.nil?)
      end
    end
  end
end
