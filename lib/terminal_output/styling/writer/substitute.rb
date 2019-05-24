module TerminalOutput
  module Styling
    class Writer
      module Substitute
        def self.build(cls=nil)
          cls ||= Writer

          substitute = cls.new
          substitute.extend(WrittenPredicate)
          substitute
        end

        module WrittenPredicate
          def written?(text=nil, &block)
            if text.nil? && !block.nil?
              text = String.new

              Writer.(text, &block)
            end

            device.written?(text)
          end
        end
      end
    end
  end
end
