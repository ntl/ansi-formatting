require_relative '../../automated_init'

context "Writer" do
  context "Trait Macro" do
    context "Alias" do
      trait = Controls::Trait.example

      writer_class = Controls::Writer.example_class do
        trait(:some_trait, trait, alias: :some_alias)
      end

      context "Class Method" do
        test "Defines alias" do
          method_alias = writer_class.method(:some_alias)
          trait_method = writer_class.method(:some_trait)

          assert(method_alias == trait_method)
        end
      end

      context "Instance Methods" do
        context "Activate Method" do
          test "Defines alias" do
            method_alias = writer_class.instance_method(:some_alias)
            trait_method = writer_class.instance_method(:some_trait)

            assert(method_alias == trait_method)
          end
        end

        context "Newline Variant Method" do
          test "Defines alias" do
            method_alias = writer_class.instance_method(:some_alias!)
            trait_method = writer_class.instance_method(:some_trait!)

            assert(method_alias == trait_method)
          end
        end

        context "Reset Method" do
          test "Defines alias" do
            method_alias = writer_class.instance_method(:reset_some_alias)
            trait_method = writer_class.instance_method(:reset_some_trait)

            assert(method_alias == trait_method)
          end
        end
      end
    end
  end
end
