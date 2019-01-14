require_relative '../../automated_init'

context "Color" do
  context "RGB Mode" do
    context "Scale" do
      context "Optional Gradient Steps Omitted" do
        gradient_depth = Controls::Color::Mode::RGB::Scale.gradient_depth

        scale = Color::Mode::RGB.scale(gradient_depth)

        test "Enumerates over a combination of gradients for each pigment" do
          control_scale = Controls::Color::Mode::RGB::Scale.example

          assert(scale.to_a == control_scale)
        end
      end

      context "Optional Gradient Steps Specified" do
        gradient_depth = Controls::Color::Mode::RGB::Scale::Stepped.gradient_depth
        gradient_steps = Controls::Color::Mode::RGB::Scale::Stepped.gradient_steps

        scale = Color::Mode::RGB.scale(gradient_depth, gradient_steps: gradient_steps)

        test "Enumerates over a combination of stepped gradients for each pigment" do
          control_scale = Controls::Color::Mode::RGB::Scale::Stepped.example

          assert(scale.to_a == control_scale)
        end
      end
    end
  end
end
