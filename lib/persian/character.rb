# -*- coding: UTF-8 -*-

class Persian
  def self.character char

    chars = {
      "ك" => "ک",
      "دِ" => "د",
      "بِ" => "ب",
      "زِ" => "ز",
      "ذِ" => "ذ",
      "شِ" => "ش",
      "سِ" => "س",
      "ى" => "ی",
      "ي" => "ی",
      "ة" => "ه",
      "هٔ" => "ه"
    }

    chars.each {|k, v|
      char.gsub!(k, v)
    }

    return char
  end
end
