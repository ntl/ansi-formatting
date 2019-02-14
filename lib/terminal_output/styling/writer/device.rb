module TerminalOutput
  module Styling
    class Writer
      class Device
        def io
          @io ||= StringIO.new
        end
        attr_writer :io

        def mode
          @mode ||= Mode.text
        end
        attr_writer :mode

        def omit_escape_sequences
          @omit_escape_sequences ||= false
        end
        attr_writer :omit_escape_sequences
        alias_method :omit_escape_sequences?, :omit_escape_sequences

        def omit_escape_sequences!
          self.omit_escape_sequences = true
        end

        def nesting
          @nesting ||= 0
        end
        attr_writer :nesting

        def sync(&block)
          self.nesting += 1

          block.() unless block.nil?

          self.nesting -= 1

          text('') if nesting.zero?

          return mode == Mode.text
        end

        def code(code)
          return 0 if omit_escape_sequences?

          bytes_written = 0

          if mode == Mode.text
            bytes_written += io.write("\e[")

            self.mode = Mode.escape_sequence
          else
            bytes_written += io.write(';')
          end

          bytes_written += io.write(code)
          bytes_written
        end

        def newline
          text(newline_character)
        end

        def newline_character
          self.class.newline_character
        end

        def self.newline_character
          @newline_character ||= StringIO.new.tap(&:puts).string
        end

        def text(text)
          bytes_written = 0

          if mode == Mode.escape_sequence
            bytes_written += io.write('m')

            self.mode = Mode.text
          end

          bytes_written += io.write(text)
          bytes_written
        end

        module Mode
          def self.text
            :text
          end

          def self.escape_sequence
            :escape_sequence
          end
        end
      end
    end
  end
end
