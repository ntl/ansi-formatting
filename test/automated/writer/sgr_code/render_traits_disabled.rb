require_relative '../../automated_init'

context "Writer" do
  context "SGR Code" do
    context "Render Traits Setting Is Disabled" do
      sgr_code = Controls::SGR::Code.example

      context "Writer Mode: Text" do
        writer = Write.new
        writer.render_traits = false

        assert(writer.mode == Write::Mode.text)

        return_value = writer.sgr_code(sgr_code)

        test "Writes nothing" do
          assert(writer.device.string == '')
        end

        test "Writer remains in text mode" do
          assert(writer.mode == Write::Mode.text)
        end

        test "Returns writer" do
          assert(return_value == writer)
        end
      end

      context "Writer Mode: Styling" do
        writer = Write.new
        writer.render_traits = false

        writer.mode = Write::Mode.styling

        return_value = writer.sgr_code(sgr_code)

        test "Writes nothing" do
          assert(writer.device.string == '')
        end

        test "Writer changes to text mode" do
          assert(writer.mode == Write::Mode.text)
        end

        test "Returns writer" do
          assert(return_value == writer)
        end
      end
    end
  end
end
