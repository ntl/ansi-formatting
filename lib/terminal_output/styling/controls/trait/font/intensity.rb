module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Font
          module Intensity
            module Variant
              def self.example
                list[0]
              end

              def self.list
                [
                  :bold,
                  :faint,
                  :normal
                ]
              end
            end

            module Code
              def self.example(variant=nil)
                variant ||= Variant.example

                map.fetch(variant)
              end

              def self.reset
                Styling::SGR::Code.fetch(:reset_intensity)
              end

              def self.map
                Styling::Trait::Font::Intensity.codes
              end
            end
          end
        end
      end
    end
  end
end
