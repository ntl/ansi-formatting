require_relative '../../automated_init'

context "Raw Writer" do
  context "Configure Dependency" do
    context "Optional Render Styling Argument" do
      context "Disabled" do
        receiver = OpenStruct.new

        Write::Raw.configure(receiver, render_styling: false)

        test "Configures receiver with raw writer that omits styling" do
          assert(receiver.write.instance_of?(Write::Raw::OmitStyling))
        end
      end

      context "Enabled" do
        receiver = OpenStruct.new

        Write::Raw.configure(receiver, render_styling: true)

        test "Configures receiver with raw writer" do
          assert(receiver.write.instance_of?(Write::Raw))
        end
      end
    end
  end
end
