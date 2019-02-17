module Fixtures
  module Writer
    module Style
      class Reset
        include TestBench::Bootstrap::Fixture
        include Style

        def call(prose=nil)
          context prose do
            writer = writer_class.new

            return_value = action.(writer)

            test "Resets the style" do
              writer.device.sync

              assert(writer.device.written?("\e[#{control_style.reset_code}m"))
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
