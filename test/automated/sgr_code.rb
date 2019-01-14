require_relative './automated_init'

context "SGR Code" do
  Controls::SGR.map.each do |id, control_code|
    context "Identifier: #{id.inspect}" do
      context "Get Code" do
        code = SGR::Code.get(id)

        comment "Sample: [Unstyled, \e[#{control_code}mControl\e[0m, \e[#{code}mActual\e[0m]"

        test "Returns SGR code: #{control_code}" do
          assert(code == control_code)
        end
      end

      context "Fetch Code" do
        code = SGR::Code.fetch(id)

        test "Returns SGR code: #{control_code}" do
          assert(code == control_code)
        end
      end
    end
  end

  context "Unknown Code: :unknown" do
    id = :unknown

    context "Get Code" do
      code = SGR::Code.get(id)

      test "Returns nothing" do
        assert(code.nil?)
      end
    end

    context "Fetch Code" do
      begin
        SGR::Code.fetch(id)
      rescue SGR::Code::Error => error
      end

      test "Raises error" do
        refute(error.nil?)
      end
    end
  end
end
