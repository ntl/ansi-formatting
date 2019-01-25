module TerminalOutput
  module Styling
    module Controls
      module Trait
        module Underline
          module Variant
            def self.example
              list[0]
            end

            def self.list
              [
                :single,
                :double,
                :none
              ]
            end
          end

          module Code
            def self.example(variant=nil)
              variant ||= Variant.example

              map.fetch(variant)
            end

            def self.reset
              Styling::SGR::Code.fetch(:reset_underline)
            end

            def self.map
              Styling::Trait::Underline.codes
            end
          end
        end
      end
    end
  end
end
