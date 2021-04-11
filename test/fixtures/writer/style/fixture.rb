module Fixtures
  module Writer
    class Style
      module Fixture
        def self.included(cls)
          cls.class_exec do
            include TestBench::Fixture

            extend Build
          end
        end

        attr_reader :action

        def code
          control_style.code
        end

        def reset_code
          control_style.reset_code
        end

        def control_style
          @control_style ||= Controls::Style.example
        end
        attr_writer :control_style

        def writer_class
          @writer_class ||= TerminalOutput::Styling::Writer
        end
        attr_writer :writer_class

        attr_accessor :prose

        def initialize(action)
          @action = action
        end

        module Build
          def build(prose=nil, style: nil, writer_class: nil, &action)
            instance = new(action)
            instance.prose = prose unless prose.nil?
            instance.control_style = style unless style.nil?
            instance.writer_class = writer_class unless writer_class.nil?
            instance
          end
        end
      end
    end
  end
end
