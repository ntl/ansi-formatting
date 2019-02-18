require_relative '../../automated_init'

context "Writer" do
  context "Configure Dependency" do
    receiver = OpenStruct.new

    writer = Writer.configure(receiver)

    test "Assigns an instance to receiver's writer attribute" do
      assert(receiver.writer.instance_of?(Writer))
    end

    test "Returns the instance" do
      assert(writer.equal?(receiver.writer))
    end
  end
end
