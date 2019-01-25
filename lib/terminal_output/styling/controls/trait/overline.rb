module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Overline
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
              Styling::SGR::Code.fetch(:reset_overline)
            end

            def self.map
              Styling::Trait::Overline.codes
            end
          end
        end
      end
    end
  end
end
