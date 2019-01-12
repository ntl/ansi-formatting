module Fixtures
  module Color
    module Palette
      class Color
        include TestBench::Bootstrap::Fixture

        attr_reader :palette
        attr_reader :color_id
        attr_reader :control_foreground
        attr_reader :control_background

        def initialize(palette, color_id, control_foreground, control_background)
          @palette = palette
          @color_id = color_id
          @control_foreground = control_foreground
          @control_background = control_background
        end

        def self.call(palette, color_id:, foreground:, background:)
          instance = new(palette, color_id, foreground, background)
          instance.()
        end

        def call
          context "Color ID Predicate" do
            test "Returns true" do
              assert(palette.color_id?(color_id))
            end
          end

          context "Get Color" do
            color = palette.get(color_id)

            test "Foreground Code" do
              foreground = color.foreground

              comment "Sample: [\e[#{control_foreground}mControl\e[0m, \e[#{foreground}mActual\e[0m]"

              assert(foreground == self.control_foreground)
            end

            test "Background Code" do
              background = color.background

              comment "Sample: [\e[#{control_background}mControl\e[0m, \e[#{background}mActual\e[0m]"

              assert(background == self.control_background)
            end
          end
        end
      end
    end
  end
end
