module TerminalOutput
  module Styling
    module Controls
      module Writer
        def self.example(cls=nil, &block)
          cls ||= example_class(&block)

          cls.new
        end

        def self.example_class(&block)
          Class.new(TerminalOutput::Styling::Writer) do
            class_exec(&block) unless block.nil?
          end
        end

        Example = self.example_class
      end
    end
  end
end
