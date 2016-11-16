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

    BRACKETS = [
      '[',
      ']',
      '{',
      '}',
      '<',
      '>',
      '«',
      '»'
    ].freeze

    SIGNS = [
      '!',
      '@',
      '#',
      '$',
      '%',
      '&',
      '*',
      '~',
      '`',
      '\'',
      '"',
      ':',
      ';',
      '.',
      '?',
      '<',
      '>',
      '/',
      '-',
      '+',
      '-',
      '_',
      '^',
      MAD,
      NOGHTE,
      VIRGOOL,
      NOGHTEVIRGOOL,
      DONOGHTE,
      TAAJOB,
      SOAL,
      BEALAVE,
      DARSAD,
      MENHA,
      MOSAVI,
      TAGHSIM,
      ZARBDAR,
      KESH
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
      '1' => YEK,
      '2' => DOW,
      '3' => SE,
      '4' => CHAHAR,
      '5' => PANJ,
      '6' => SHESH,
      '7' => HAFT,
      '8' => HASHT,
      '9' => NOH,
      '0' => SEFR,
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
