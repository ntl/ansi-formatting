module Fixtures
  module Writer
    module Trait
      module Reset
        def self.call(name:, trait:, writer_class:)
          method = :"reset_#{name}"

          style = trait.style

          Style::Reset.(style: style, writer_class: writer_class) do |writer|
            writer.public_send(method)
          end
        end
      end
    end
  end
end
