module Fixtures
  class Writer
    class Style
      include TestBench::Bootstrap::Fixture

      attr_reader :writer_class
      attr_reader :style_name
      attr_reader :control_style

      def initialize(writer_class, style_name, control_style)
        @writer_class = writer_class
        @style_name = style_name
        @control_style = control_style
      end

      def self.call(writer_class: nil, name:, style:)
        writer_class ||= TerminalOutput::Styling::Write

        instance = new(writer_class, name, style)
        instance.()
      end

      def call
        context "Class Method" do
          style = writer_class.public_send(style_name)

          test "Resolves the style corresponding to control_style's default variant" do
            assert(style == control_style)
          end
        end

        context "Instance Methods" do
          Style::Activate.(writer_class: writer_class, style: control_style)

          Style::Reset.(writer_class: writer_class, style: control_style)
        end
      end
    end
  end
end
