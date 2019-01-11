require_relative '../../automated_init'

context "Color" do
  context "RGB Mode" do
    context "Gradient" do
      context "Optional Steps Omitted" do
        depth = Controls::Color::Mode::RGB::Gradient.depth

        gradient = Color::Mode::RGB.gradient(depth)

        test "Enumerates all integers from zero to predecessor of given depth" do
          assert(gradient.to_a == Controls::Color::Mode::RGB::Gradient.example)
        end
      end

      context "Optional Steps Specified" do
        context do
          steps = Controls::Color::Mode::RGB::Gradient::Stepped.steps

          depth = Controls::Color::Mode::RGB::Gradient::Stepped.depth

          gradient = Color::Mode::RGB.gradient(depth, steps: steps)

          test "Gradient length is limited by the given number of steps" do
            assert(gradient.to_a == Controls::Color::Mode::RGB::Gradient::Stepped.example)
          end
        end

        context "Minimum Number of Steps" do
          depth = Controls::Color::Mode::RGB::Gradient::Stepped::Minimum.depth

          gradient = Color::Mode::RGB.gradient(depth, steps: :minimum)

          test "Enumerates zero and predecessor of given depth" do
            assert(gradient.to_a == Controls::Color::Mode::RGB::Gradient::Stepped::Minimum.example)
          end
        end

        context "Maximum Number of Steps" do
          depth = Controls::Color::Mode::RGB::Gradient::Stepped::Maximum.depth

          gradient = Color::Mode::RGB.gradient(depth, steps: :maximum)

          test "Enumerates all steps" do
            assert(gradient.to_a == Controls::Color::Mode::RGB::Gradient::Stepped::Maximum.example)
          end
        end

        context "Depth Does Not Divide Evenly Into Specified Number of Steps" do
          steps = Controls::Color::Mode::RGB::Gradient::Stepped::Rounding.steps

          depth = Controls::Color::Mode::RGB::Gradient::Stepped::Rounding.depth

          gradient = Color::Mode::RGB.gradient(depth, steps: steps)

          test "Spreads steps across range as evenly as possible" do
            assert(gradient.to_a == Controls::Color::Mode::RGB::Gradient::Stepped::Rounding.example)
          end
        end

        context "Incorrect" do
          depth = Controls::Color::Mode::RGB::Gradient.depth

          context "One Step" do
            steps = 1

            begin
              Color::Mode::RGB.gradient(depth, steps: steps)
            rescue Color::Mode::RGB::Error => error
            end

            test "Raises error" do
              refute(error.nil?)
            end
          end

          context "Number of Steps Exceeds Depth" do
            steps = depth + 1

            begin
              Color::Mode::RGB.gradient(depth, steps: steps)
            rescue Color::Mode::RGB::Error => error
            end

            test "Raises error" do
              refute(error.nil?)
            end
          end
        end
      end
    end
  end
end
