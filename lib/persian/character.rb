# -*- coding: UTF-8 -*-

class Persian
  def self.character char
    
    @arabic_to_persian_chars.each {|k, v|
      char.gsub!(k, v)
    }

    return char
  end
end
