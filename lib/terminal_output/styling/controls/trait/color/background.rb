module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Color
          module Background
            module Variant
              def self.example
                Controls::Color::ID.example
              end
            end

            module Code
              def self.example(variant=nil)
                variant ||= Variant.example

                Controls::Color::Background.code(variant)
              end

              def self.reset
                Styling::SGR::Code.fetch(:reset_background)
              end
            end
          end
        end
      end
    end
  end
end
