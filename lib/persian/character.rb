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
end
