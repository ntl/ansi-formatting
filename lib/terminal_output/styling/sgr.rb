module TerminalOutput
  module Styling
    module SGR
      module Code
        Error = Class.new(RuntimeError)

        def self.get(id)
          MAP[id]
        end

        def self.fetch(id)
          get(id) or
            raise Error, "Unknown SGR identifier `#{id.inspect}'"
        end

        MAP = {
          :reset => '0',
          :bold => '1',
          :increased_intensity => '1',
          :faint => '2',
          :decreased_intensity => '2',
          :italic => '3',
          :underline => '4',
          :blink => '5',
          :rapid_blink => '6',
          :negative_image => '7',
          :conceal => '8',
          :crossed_out => '9',

          :primary_font => '10',
          :first_alternate_font => '11',
          :second_alternate_font => '12',
          :third_alternate_font => '13',
          :fourth_alternate_font => '14',
          :fifth_alternate_font => '15',
          :sixth_alternate_font => '16',
          :seventh_alternate_font => '17',
          :eighth_alternate_font => '18',
          :ninth_alternate_font => '19',

          :fraktur => '20',
          :gothic => '20',
          :double_underline => '21',
          :reset_intensity => '22',
          :reset_italic => '23',
          :reset_fraktur => '23',
          :reset_gothic => '23',
          :reset_underline => '24',
          :reset_blink => '25',
          :reserved_proportional_spacing => '26',
          :positive_image => '27',
          :reset_conceal => '28',
          :reset_crossed_out => '29',

          :black_display => '30',
          :red_display => '31',
          :green_display => '32',
          :yellow_display => '33',
          :blue_display => '34',
          :magenta_display => '35',
          :cyan_display => '36',
          :white_display => '37',
          :reserved_set_display_color => '38',
          :reset_display => '39',

          :black_background => '40',
          :red_background => '41',
          :green_background => '42',
          :yellow_background => '43',
          :blue_background => '44',
          :magenta_background => '45',
          :cyan_background => '46',
          :white_background => '47',
          :reserved_set_background_color => '48',
          :reset_background => '49',

          :reserved_reset_proportional_spacing => '50',
          :framed => '51',
          :encircled => '52',
          :overline => '53',
          :reset_framed => '54',
          :reset_encircled => '54',
          :reset_overline => '55',
          :reserved_56 => '56',
          :reserved_57 => '57',
          :reserved_58 => '58',
          :reserved_59 => '59',

          :ideogram_underline => '60',
          :ideogram_right_side_line => '60',
          :ideogram_double_underline => '61',
          :ideogram_double_right_side_line => '61',
          :ideogram_overline => '62',
          :ideogram_left_side_line => '62',
          :ideogram_double_overline => '63',
          :ideogram_double_left_side_line => '63',
          :ideogram_stress_marking => '64',
          :reset_ideogram => '65'
        }
      end
    end
  end
end
