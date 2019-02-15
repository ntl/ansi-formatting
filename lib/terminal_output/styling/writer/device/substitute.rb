module TerminalOutput
  module Styling
    class Writer
      class Device
        class Substitute < Device
          singleton_class.alias_method :build, :new

          def written?(text=nil)
            if text.nil?
              !io.string.empty?
            else
              io.string == text
            end
          end
        end
      end
    end
  end
end
