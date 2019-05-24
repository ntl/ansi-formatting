module TerminalOutput
  module Styling
    module Controls
      module Text
        def self.example
          'Some text'
        end

        def self.alternate
          'Other text'
        end

        module Newline
          def self.example
            string = String.new

            StringIO.new(string).puts

            string
          end
        end
      end
    end
  end
end
