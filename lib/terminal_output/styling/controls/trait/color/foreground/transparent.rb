module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Color
          module Foreground
            module Transparent
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
                  Styling::SGR::Code.fetch(:reset_conceal)
                end

                def self.map
                  Styling::Trait::Color::Foreground::Transparent.codes
                end
              end
            end
          end
        end
      end
    end
  end
end
