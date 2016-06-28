# -*- coding: UTF-8 -*-

# Persian class :: characters
class Persian
  def self.character(char)
    @arabic_to_persian_chars.each { |k, v| char.gsub!(k, v) }

    char
  end

  def self.remove_extra_spaces(char)
    char.split.join(" ")
  end
end
