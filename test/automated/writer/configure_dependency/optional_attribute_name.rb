require_relative '../../automated_init'

context "Writer" do
  context "Device" do
    context "Configure Dependency" do
      context "Optional Attribute Name" do
        receiver = OpenStruct.new

        Writer.configure(receiver, attr_name: :some_attr)

        test "Configures given receiver attribute" do
          assert(receiver.some_attr.instance_of?(Writer))
        end
      end
    end
  end
end
