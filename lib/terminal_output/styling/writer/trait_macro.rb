module TerminalOutput
  module Styling
    class Writer
      module TraitMacro
        def trait_macro(name, trait)
          singleton_class.instance_exec do
            define_method(name) do |variant=nil|
              trait.style(variant)
            end
          end
        end
        alias_method :trait, :trait_macro
      end
    end
  end
end
