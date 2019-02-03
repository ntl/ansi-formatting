require_relative '../automated_init'

context "Raw Writer" do
  context "Omit Styling" do
    context "Write Text" do
      raw_writer = Write::Raw::OmitStyling.new

      raw_writer.text('Some text')

      test "Writes given text to device" do
        assert(raw_writer.device.string == 'Some text')
      end
    end

    context "Sync" do
      raw_writer = Write::Raw::OmitStyling.new

      raw_writer.sync

      test "Writes nothing to device" do
        assert(raw_writer.device.string.empty?)
      end
    end

    context "Code" do
      code = Controls::Style::Code.example

      raw_writer = Write::Raw::OmitStyling.new

      raw_writer.code(code)

      test "Writes nothing to device" do
        assert(raw_writer.device.string.empty?)
      end
    end
  end
end
