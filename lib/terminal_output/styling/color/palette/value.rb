module TerminalOutput
  module Styling
    module Color
      module Palette
        Value = Struct.new(:color_fragment) do
          def self.build(color_id)
            color_fragment = decode(color_id)

            new(color_fragment)
          end

          def self.get(color_id)
            return nil unless color_id?(color_id)

            build(color_id)
          end

          def self.color_id?(color_id)
            false
          end

          def foreground
            "#{foreground_fragment}#{color_fragment}"
          end

          def background
            "#{background_fragment}#{color_fragment}"
          end

          module Cache
            def self.extended(cls)
              cls.singleton_class.class_exec do
                prepend Get
              end
            end

            module Get
              def get(color_id)
                get_cache[color_id] ||= super
              end

              def get_cache
                @get_cache ||= {}
              end
            end
          end
        end
      end
    end
  end
end
