module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Font
          module Fraktur
            module Variant
              def self.example
                list[0]
              end

              def self.list
                [
                  :on,
                  :off
                ]
              end
            end

            module Code
              def self.example(variant=nil)
                variant ||= Variant.example

                map.fetch(variant)
              end

              def self.reset
                Styling::SGR::Code.fetch(:reset_fraktur)
              end

              def self.map
                Styling::Trait::Font::Fraktur.codes
              end
            end
          end
        end
      end
    end
  end
end
