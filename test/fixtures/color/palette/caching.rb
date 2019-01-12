module Fixtures
  module Color
    module Palette
      class Caching
        include TestBench::Bootstrap::Fixture

        attr_reader :palette
        attr_reader :color_id

        def initialize(palette, color_id)
          @palette = palette
          @color_id = color_id
        end

        def self.call(palette, color_id)
          instance = new(palette, color_id)
          instance.()
        end

        def call
          palette.color_id?(color_id) or fail

          color_1 = palette.get(color_id)
          color_2 = palette.get(color_id)

          test "Color retrievals are cached" do
            assert(color_1.equal?(color_2))
          end
        end
      end
    end
  end
end
