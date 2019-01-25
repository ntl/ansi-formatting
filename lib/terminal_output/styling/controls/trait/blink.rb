module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Blink
          module Variant
            def self.example
              list[0]
            end

            def self.list
              [
                :slow,
                :rapid,
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
              Styling::SGR::Code.fetch(:reset_blink)
            end

            def self.map
              Styling::Trait::Blink.codes
            end
          end
        end
      end
    end
  end
end
