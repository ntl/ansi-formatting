module TerminalOutput
  module Styling
    class Write
      extend TraitMacro
      extend StyleMacro

      def raw_writer
        @raw_writer ||= Raw::Substitute.build
      end
      attr_writer :raw_writer

      def batching
        @batching ||= false
      end
      attr_writer :batching
      alias_method :batching?, :batching

      def self.build(device=nil, render_styling: nil)
        instance = new
        Raw.configure(instance, device, render_styling: render_styling, attr_name: :raw_writer)
        instance
      end

      trait :font_weight, Trait::Font::Weight
      trait :font_slant, Trait::Font::Slant
      trait :fraktur_font, Trait::Font::Fraktur
      trait :underline, Trait::Underline
      trait :blink, Trait::Blink
      trait :strikethrough, Trait::Strikethrough
      trait :overline, Trait::Overline
      trait :reverse_video, Trait::Color::ReverseVideo
      trait :transparent_foreground, Trait::Color::Foreground::Transparent, alias: :transparent
      trait :foreground_color, Trait::Color::Foreground, alias: :fg
      trait :background_color, Trait::Color::Background, alias: :bg

      style :bold, font_weight(:bold)
      style :faint, font_weight(:faint)
      style :italic, font_slant(:italic)
      style :fraktur, fraktur_font(:on)
      style :single_underline, underline(:single)
      style :double_underline, underline(:double)
      style :slow_blink, blink(:slow)
      style :rapid_blink, blink(:rapid)

      Color::Palette::Standard.color_fragments.each_key do |color_id|
        style color_id, foreground_color(color_id)
        style :"#{color_id}_bg", background_color(color_id)
      end

      Color::Palette::HighIntensity.color_fragments.each_key do |color_id|
        style color_id, foreground_color(color_id)
        style :"#{color_id}_bg", background_color(color_id)
      end

      def trait(trait, variant, text=nil, &block)
        style = trait.style(variant)

        style(style, text, &block)
      end

      def reset_trait(trait)
        style = trait.style

        reset_style(style)
      end

      def style(style, text=nil, &block)
        code = style.code

        batch do
          code(code)

          unless text.nil? && block.nil?
            text(text) unless text.nil?

            instance_exec(self, &block) unless block.nil?

            reset_style(style)
          end
        end
      end

      def reset_style(style)
        reset_code = style.reset_code

        batch do
          code(reset_code)
        end
      end

      def reset
        sgr(:reset)
      end

      def sgr(sgr_id)
        code = SGR::Code.fetch(sgr_id)

        batch do
          code(code)
        end
      end

      def batch(&block)
        if batching?
          instance_exec(self, &block)
          return self
        end

        self.batching = true

        begin
          return batch(&block)
        ensure
          raw_writer.sync
        end
      end

      def text(text)
        raw_writer.text(text)
        self
      end

      def code(code)
        raw_writer.code(code)
        self
      end
    end
  end
end
