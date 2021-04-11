module Fixtures
  module Writer
    class Style
      class Activate
        include Fixture

        def call
          context prose do
            writer = writer_class.new

            return_value = action.(writer)

            test "Activates style" do
              writer.device.sync

              assert(writer.device.written?("\e[#{code}m"))
            end

            test "Returns the writer" do
              assert(return_value == writer)
            end
          end
        end
      end
    end
  end
end
