module TerminalOutput
  module Styling
    module Color
      Error = Class.new(RuntimeError)

      def self.color_id?(color_id)
        Palette::Standard.color_id?(color_id) or
          Palette::HighIntensity.color_id?(color_id) or
          Palette::EightBit.color_id?(color_id) or
          Palette::TwentyFourBit.color_id?(color_id)
      end

      def self.get(color_id)
        Palette::Standard.get(color_id) or
          Palette::HighIntensity.get(color_id) or
          Palette::EightBit.get(color_id) or
          Palette::TwentyFourBit.get(color_id)
      end

      def self.fetch(color_id)
        get(color_id) or
          raise Error, "Unknown color `#{color_id.inspect}'"
      end
    end
  end
end
