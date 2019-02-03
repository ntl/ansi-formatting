require_relative '../../automated_init'

context "Raw Writer" do
  context "Configure Dependency" do
    context "Optional Argument Name" do
      receiver = OpenStruct.new

      Write::Raw.configure(receiver, attr_name: :some_attr)

      test "Configures receiver attribute corresponding to given name" do
        assert(receiver.some_attr.is_a?(Write::Raw))
      end
    end
  end
end
