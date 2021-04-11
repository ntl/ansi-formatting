module Fixtures
  module Color
    module Palette
      class Color
        class Unknown
          include TestBench::Fixture

          attr_reader :palette
          attr_reader :color_id

          def initialize(palette, color_id)
            @palette = palette
            @color_id = color_id
          end

          def call
            context "Color ID Predicate" do
              test "Returns false" do
                refute(palette.color_id?(color_id))
              end
            end

            context "Get Color" do
              color = palette.get(color_id)

              test "Returns nothing" do
                assert(color.nil?)
              end
            end
          end
        end
      end
    end
  end
end
