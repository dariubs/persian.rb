# -*- coding: UTF-8 -*-

# Persian class :: characters
class Persian
  # Replace Arabic characters with Persian characters.
  def self.character(char)
    @arabic_to_persian_chars.each { |k, v| char.gsub!(k, v) }
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
    @harekats.each { |v| char.gsub!(v, '') }
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

  def self.english_to_persian_char(char)
    @english_to_persian_keyboard_chars.each { |k, v| char.gsub!(k, v) }
    char
  end

  def self.persian_to_english_char(char)
    @english_to_persian_keyboard_chars.each { |v, k| char.gsub!(k, v) }
    char
  end

  def self.fix_y_after_vowel(char)
    char += '‌ی' if @end_vowel.include? char[-1]
    char
  end
end
