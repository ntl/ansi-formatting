require_relative '../../automated_init'

context "Writer" do
  context "Sync" do
    context "Writer Mode: Text" do
      writer = Write.new
      assert(writer.mode == Write::Mode.text)

      return_value = writer.sync

      test "Writes nothing to device" do
        assert(writer.device.string.empty?)
      end

      test "Writer remains in text mode" do
        assert(writer.mode == Write::Mode.text)
      end

      test "Returns writer" do
        assert(return_value == writer)
      end
    end
  end
end
