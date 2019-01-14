module TerminalOutput
  module Styling
    module Controls
      module Color
        module Mode
          module RGB
            module Scale
              def self.example(gradient=nil)
                gradient ||= Gradient.example

                gradient.product(gradient, gradient)
              end

              def self.gradient_depth
                Gradient.depth
              end

              module Stepped
                def self.example
                  gradient = Gradient::Stepped.example

                  Scale.example(gradient)
                end

                def self.gradient_steps
                  Gradient::Stepped.steps
                end

                def self.gradient_depth
                  Gradient::Stepped.depth
                end
              end
            end
          end
        end
      end
    end
  end
end
