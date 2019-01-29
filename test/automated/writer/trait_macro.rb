require_relative '../automated_init'

context "Writer" do
  context "Trait Macro" do
    trait = Controls::Trait.example

    variant = Controls::Trait::Variant.example

    writer_class = Class.new(Write) do
      trait(:some_trait, trait)
    end

    context "Class Method" do
      style = writer_class.some_trait(variant)

      test "Returns style corresponding to given variant" do
        control_style = trait.style(variant)

        assert(style == control_style)
      end
    end

    context "Instance Methods" do
      Fixtures::Writer::Style.(
        writer_class: writer_class,
        style: trait.style(variant),
        activate: proc { |writer, text=nil, &block|
          writer.some_trait(variant, text, &block)
        },
        reset: proc { |writer|
          writer.reset_some_trait
        }
      )
    end
  end
end
