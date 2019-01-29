module TerminalOutput
  module Styling
    class Write
      module TraitMacro
        def trait_macro(name, trait, alias: nil)
          trait_alias = binding.local_variable_get(:alias)

          define_method(name) do |variant_or_text=nil, text=nil, &block|
            if trait.variant?(variant_or_text)
              variant = variant_or_text
            else
              text = variant_or_text
            end

            trait(trait, variant, text, &block)
          end

          define_method(:"reset_#{name}") do
            reset_trait(trait)
          end

          define_singleton_method(name) do |variant=nil|
            trait.style(variant)
          end

          unless trait_alias.nil?
            alias_method(trait_alias, name)
            alias_method(:"reset_#{trait_alias}", :"reset_#{name}")

            singleton_class.class_exec do
              alias_method(trait_alias, name)
            end
          end
        end
        alias_method :trait, :trait_macro
      end
    end
  end
end
