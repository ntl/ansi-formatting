module TerminalOutput
  module Styling
    module Color
      module Mode
        module RGB
          Error = Class.new(RuntimeError)

          def self.gradient(depth, steps: nil)
            steps ||= :maximum

            if steps == :minimum
              steps = 2
            elsif steps == :maximum
              steps = depth
            end

            unless (2..depth).include?(steps)
              raise Error, "Number of steps must be > 1 and \u2264 depth (Steps: #{steps}, Depth: #{depth})"
            end

            range = (0...depth)

            step_size = Rational(depth - 1, steps - 1)

            range.step(step_size).lazy.map do |value|
              value.round(half: :even)
            end
          end
        end
      end
    end
  end
end
