module TerminalOutput
  module Styling
    class Write
      module TraitMacro
        def trait_macro(name, trait)
          define_method(name) do |variant, text=nil, &block|
            trait(trait, variant, text, &block)
          end

          define_method(:"reset_#{name}") do
            reset_trait(trait)
          end

          define_singleton_method(name) do |variant|
            trait.style(variant)
          end
        end
        alias_method :trait, :trait_macro
      end
    end
  end
end
