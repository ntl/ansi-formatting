module TerminalOutput
  module Styling
    def self.activate(target_class=nil)
      target_class ||= ::String

      target_class.class_exec do
        include Styling
      end
    end

    def self.included(cls)
      cls.class_exec do
        define_singleton_method(:style) do |&block|
          Build.(&block)
        end
      end
    end

    def style(**arguments)
      Apply.(self, **arguments)
    end

    def style!(**arguments)
      Apply.!(self, **arguments)
    end
  end
end
