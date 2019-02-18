module TerminalOutput
  module Styling
    class Writer
      extend TraitMacro
      extend StyleMacro

      def self.inherited(subclass)
        substitute_module = Module.new do
          define_singleton_method(:build) do
            Substitute.build(subclass)
          end
        end

        subclass.class_exec do
          const_set(:Substitute, substitute_module)
        end
      end

      def device
        @device ||= Device::Substitute.build
      end
      attr_writer :device

      def self.build(io=nil, styling: nil)
        instance = new
        Device.configure(instance, io, styling: styling)
        instance
      end

      def self.configure(receiver, io=nil, styling: nil, attr_name: nil)
        attr_name ||= :writer

        instance = build(io, styling: styling)
        receiver.public_send(:"#{attr_name}=", instance)
        instance
      end

      def self.call(io=nil, styling: nil, &block)
        instance = build(io, styling: styling)

        instance.sync(&block)

        io
      end

      trait :font_weight, Trait::Font::Weight
      trait :font_slant, Trait::Font::Slant
      trait :fraktur_font, Trait::Font::Fraktur, alias: :fraktur
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

      def style(style, text=nil, &block)
        code = style.code

        code(code)

        unless text.nil? && block.nil?
          device.sync do
            text(text) unless text.nil?

            instance_exec(self, &block) unless block.nil?

            reset_style(style)
          end
        end

        self
      end

      def style!(style, text)
        style(style).
          text(text).
          reset_style(style).
          newline
      end

      def reset_style(style)
        reset_code = style.reset_code

        code(reset_code)
      end

      def reset
        sgr(:reset)
      end

      def sgr(sgr_id)
        code = SGR::Code.fetch(sgr_id)

        code(code)
      end

      def sync(&block)
        unless block.nil?
          device.sync do
            instance_exec(self, &block)
          end
        else
          device.sync
        end

        self
      end

      def code(code)
        device.code(code)
        self
      end

      def newline
        device.newline
        self
      end

      def text!(text)
        text(text)
        newline
      end

      def text(text)
        device.text(text)
        self
      end
    end
  end
end
