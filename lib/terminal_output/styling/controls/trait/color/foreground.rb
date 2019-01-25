module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Color
          module Foreground
            module Variant
              def self.example
                Controls::Color::ID.example
              end
            end

            module Code
              def self.example(variant=nil)
                variant ||= Variant.example

                Controls::Color::Foreground.code(variant)
              end

              def self.reset
                Styling::SGR::Code.fetch(:reset_display)
              end
            end
          end
        end
      end
    end
  end
end
