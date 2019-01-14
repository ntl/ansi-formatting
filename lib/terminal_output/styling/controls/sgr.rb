module TerminalOutput
  module Styling
    module Controls
      module SGR
        def self.map
          TerminalOutput::Styling::SGR::Code::MAP
        end

        module ID
          def self.example
            :bold
          end
        end

        module Code
          def self.example(id=nil)
            id ||= ID.example

            SGR.map.fetch(id)
          end

          SGR.map.each do |id, code|
            define_singleton_method(id) do
              code
            end
          end
        end
      end
    end
  end
end
