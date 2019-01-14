module TerminalOutput
  module Styling
    module Controls
      module Color
        module Mode
          module RGB
            module Gradient
              def self.example
                [0, 1, 2]
              end

              def self.depth
                3
              end

              module Stepped
                def self.example
                  [0, 2, 4]
                end

                def self.steps
                  3
                end

                def self.depth
                  5
                end

                module Rounding
                  def self.example
                    [0, 2, 5, 8, 10]
                  end

                  def self.steps
                    5
                  end

                  def self.depth
                    11
                  end
                end

                module Minimum
                  def self.example
                    [0, 2]
                  end

                  def self.steps
                    2
                  end

                  def self.depth
                    Gradient.depth
                  end
                end

                module Maximum
                  def self.example
                    Gradient.example
                  end

                  def self.steps
                    :maximum
                  end

                  def self.depth
                    Gradient.depth
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
