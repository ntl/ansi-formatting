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

          def self.alternate
            :other_id
          end
        end

        module Code
          def self.example
            '111'
          end

          def self.alternate
            '112'
          end

          module Reset
            def self.example
              '222'
            end
          end
        end

        class Example
          include Styling::Trait

          attr_reader :default_code

          attr_reader :reset_code

          def variants
            @variants ||= {}
          end
          attr_writer :variants

          def initialize(default_code, reset_code)
            @default_code = default_code
            @reset_code = reset_code
          end

          def self.build(variants: nil, default_code: nil, reset_code: nil)
            default_code ||= Code.example
            reset_code ||= Code::Reset.example

            if variants == :none
              variants = {}
            else
              variants ||= {
                Variant.example => Code.example,
                Variant.alternate => Code.alternate
              }
            end

            instance = new(default_code, reset_code)

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
