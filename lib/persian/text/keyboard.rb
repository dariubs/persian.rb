# -*- coding: UTF-8 -*-

# Persian module
module Persian
  # Persian Text class
  # Digest Persian texts
  class Text
    # Replace english characters with it's key persian value on standard persian keyboard
    # For now just support QWERTY keyboard
    def self.english_to_persian_char(text)
      EN_FA_KEYBOARD_CHAR.each { |k, v| text.gsub!(k, v) }
      text
    end

    # Replace standard persian keyboard characters with it's key persian value on english keyboard
    # For now just support QWERTY keyboard
    def self.persian_to_english_char(text)
      EN_FA_KEYBOARD_CHAR.each { |v, k| text.gsub!(k, v) }
      text
    end

  end
end
