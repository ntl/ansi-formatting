module TerminalOutput
  module Styling
    module Build
      def self.call(&block)
        string = String.new

        Writer.(string, &block)

        string
      end
    end
  end
end
