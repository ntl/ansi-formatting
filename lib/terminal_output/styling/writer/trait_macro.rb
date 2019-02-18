module TerminalOutput
  module Styling
    class Writer
      module TraitMacro
        def trait_macro(name, trait, alias: nil)
          trait_alias = binding.local_variable_get(:alias)

          singleton_class.instance_exec do
            define_method(name) do |variant=nil|
              trait.style(variant)
            end
            alias_method(trait_alias, name) unless trait_alias.nil?
          end

          class_exec do
            define_method(name) do |variant_or_text=nil, text=nil, &block|
              if !text.nil? || trait.variant?(variant_or_text)
                variant, text = variant_or_text, text
              else
                variant, text = nil, variant_or_text
              end

              style = trait.style(variant)

              style(style, text, &block)
            end
            alias_method(trait_alias, name) unless trait_alias.nil?

            newline_method = :"#{name}!"
            define_method(newline_method) do |variant_or_text, text=nil|
              if !text.nil? || trait.variant?(variant_or_text)
                variant, text = variant_or_text, text
              else
                variant, text = nil, variant_or_text
              end

              style = trait.style(variant)

              style!(style, text)
            end
            alias_method(:"#{trait_alias}!", newline_method) unless trait_alias.nil?

            reset_method = :"reset_#{name}"
            define_method(reset_method) do
              reset_code = trait.reset_code

              code(reset_code)
            end
            alias_method(:"reset_#{trait_alias}", reset_method) unless trait_alias.nil?
          end
        end
        alias_method :trait, :trait_macro
      end
    end
  end
end
