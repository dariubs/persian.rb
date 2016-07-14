# -*- coding: UTF-8 -*-

# Persian class :: characters
class Persian
  # Replace Arabic characters with Persian characters.
  def self.character(char)
    AR_FA_CHAR.each { |k, v| char.gsub!(k, v) }
    char
  end

  # Remove extra spaces in text
  def self.remove_extra_spaces(char)
    char = char.split.join(' ')
    char = char.split('‌').join('‌')
    char
  end

  # Remove Arabic harecats from text
  def self.remove_harekats(char)
    HAREKATS.each { |v| char.gsub!(v, '') }
    char
  end

  # Replace general brackets with one type brackets
  # Default: 	0xAB & 	0xBB
  def self.general_brackets(char, left = '«', right = '»')
    char.gsub!(/"(.*?)"/, left + '\1' + right)
    char.gsub!(/\[(.*?)\]/, left + '\1' + right)
    char.gsub!(/\{(.*?)\}/, left + '\1' + right)
    char.gsub!(/\((.*?)\)/, left + '\1' + right)
    char
  end

  # Replace english characters with it's key persian value on standard persian keyboard
  # For now just support QWERTY keyboard
  def self.english_to_persian_char(char)
    EN_FA_KEYBOARD_CHAR.each { |k, v| char.gsub!(k, v) }
    char
  end

  # Replace standard persian keyboard characters with it's key persian value on english keyboard
  # For now just support QWERTY keyboard
  def self.persian_to_english_char(char)
    EN_FA_KEYBOARD_CHAR.each { |v, k| char.gsub!(k, v) }
    char
  end

  # Add '‌ی' after names that end with ه, ا, و
  def self.fix_y_after_vowel(char)
    char += '‌ی' if END_VOWEL.include? char[-1]
    char
  end

  # Split paragraphs
  # Return an array of paragraphs
  def self.paragraph(char)
    para = char.split("\n").reject(&:empty?)
    para
  end

  # Replace Space with Zero-width none-joiner after می and نمی
  def self.replace_zwnj_mi(char)
    mi = 'می'
    nmi = 'نمی'
    char.gsub!(/(^|\s)(#{mi}|#{nmi})\s(\S+)/, '\1\2‌\3')
    char
  end

  # Resplace ست with \sاست if lastest character before \s is ا
  def self.ast(char)
    a = 'ا'
    ast = 'است'
    st = 'ست'

    char.gsub!(/(#{a})\s(#{ast})/, '\1' + st)
    char
  end

  # Remove keshide from text
  def self.keshide(char)
    char.gsub!(/ـ+/, '')
    char
  end
end
