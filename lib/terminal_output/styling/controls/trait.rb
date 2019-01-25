module TerminalOutput
  module Styling
    module Controls
      module Trait
        def self.example
          Example.build
        end

        module Variant
          def self.example
            :some_id
          end
        end

        module Code
          def self.example
            '4:3'
          end

          module Reset
            def self.example
              '4:0'
            end
          end
        end

        class Example
          include Styling::Trait

          attr_reader :reset_code
          alias_method :reset, :reset_code

          attr_writer :variants
          def variants
            @variants ||= {}
          end

          def initialize(reset_code)
            @reset_code = reset_code
          end

          def self.build(variants: nil, reset_code: nil)
            reset_code ||= Code::Reset.example

            if variants == :none
              variants = {}
            else
              variants ||= {
                Variant.example => Code.example
              }
            end

            instance = new(reset_code)

            variants.each do |variant, code|
              instance.add_variant(variant, code)
            end

            instance
          end

          def variant?(variant)
            variants.key?(variant)
          end

          def get(variant)
            variants[variant]
          end

          def add_variant(variant, code)
            variants[variant] = code
          end
        end
      end
    end
  end
end
