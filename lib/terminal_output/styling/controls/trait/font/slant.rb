module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Font
          module Slant
            module Variant
              def self.example
                list[0]
              end

              def self.list
                [
                  :italic,
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
                Styling::SGR::Code.fetch(:reset_italic)
              end

              def self.map
                Styling::Trait::Font::Slant.codes
              end
            end
          end
        end
      end
    end
  end
end
