# -*- coding: UTF-8 -*-

# Persian class
module Persian
  # Class text
  class Text
    include Alphabet

    AR_FA_CHAR = {
      KAF_ARABIC => KAF,
      'دِ' => 'د',
      'بِ' => 'ب',
      'زِ' => 'ز',
      'ذِ' => 'ذ',
      'شِ' => 'ش',
      'سِ' => 'س',
      'ى' => 'ی',
      YE_ARABIC => YE,
      'ة' => 'ه',
      'هٔ' => 'ه'
    }.freeze

    HAREKATS = [
      AA, # Ae
      EE, # E
      OO, # O
      AN, # An
      EN, # En
      ON, # On
      SAKEN, # Saken
      TASHDID # Tashdid
    ].freeze

    END_VOWEL = [
      HE_DOCHESHM,
      ALEF,
      VAV
    ].freeze

    # Exchange Standard QWERTY Keyboard layout
    EN_FA_KEYBOARD_CHAR = {
      # Lowercase Letters
      'q' => ZAD,
      'w' => SAD,
      'e' => THE,
      'r' => QAF,
      't' => FE,
      'y' => GHEIN,
      'u' => EIN,
      'i' => HE_DOCHESHM,
      'o' => KHE,
      'p' => HE_JIMI,
      '[' => JIM,
      ']' => CHE,
      '\\' => '\\',
      'a' => SHIN,
      's' => SIN,
      'd' => YE,
      'f' => BE,
      'g' => LAM,
      'h' => ALEF,
      'j' => TE,
      'k' => NOON,
      'l' => MIM,
      ';' => KAF,
      '\'' => GAF,
      'z' => ZA,
      'x' => TA,
      'c' => ZE,
      'v' => RE,
      'b' => ZAL,
      'n' => DAL,
      'm' => PE,
      ',' => VAV,
      '.' => '.',
      '/' => '/',
      # Uppercase Letters
      'Q' => 'ْ',
      'W' => 'ٌ',
      'E' => 'ٍ',
      'R' => 'ً',
      'T' => 'ُ',
      'Y' => 'ِ',
      'U' => 'َ',
      'I' => 'ّ',
      'O' => ']',
      'P' => '[',
      '{' => '}',
      '}' => '{',
      '|' => '|',
      'A' => 'ؤ',
      'S' => 'ئ',
      'D' => 'ي',
      'F' => 'إ',
      'G' => 'أ',
      'H' => 'آ',
      'J' => 'ة',
      'K' => '»',
      'L' => '«',
      ':' => ':',
      '"' => '؛',
      'Z' => 'ك',
      'X' => 'ٓ',
      'C' => 'ژ',
      'V' => 'ٰ',
      'B' => '‌',
      'N' => 'ٔ',
      'M' => 'ء',
      '<' => '>',
      '>' => '<',
      '?' => '؟',
      # Numbers without shift key
      '`' => '‍',
      '1' => '۱',
      '2' => '۲',
      '3' => '۳',
      '4' => '۴',
      '5' => '۵',
      '6' => '۶',
      '7' => '۷',
      '8' => '۸',
      '9' => '۹',
      '0' => '۰',
      '-' => '-',
      '=' => '=',
      # Numbers With Shift key
      '~' => '÷',
      '!' => '!',
      '@' => '٬',
      '#' => '٫',
      '$' => '﷼',
      '%' => '٪',
      '^' => '×',
      '&' => '،',
      '*' => '*',
      '(' => ')',
      ')' => '(',
      '_' => 'ـ',
      '+' => '+'
    }.freeze
  end
end
