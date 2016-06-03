# -*- coding: UTF-8 -*-

class Persian
    def self.number num

      if num.is_a? Numeric
        num = num.to_s
      end

      nums = {
        # english numbers
        "0" => "۰",
        "1" => "۱",
        "2" => "۲",
        "3" => "۳",
        "4" => "۴",
        "5" => "۵",
        "6" => "۶",
        "7" => "۷",
        "8" => "۸",
        "9" => "۹",

        #arabic numbers
        "٠" => "۰",
        "١" => "۱",
        "٢" => "۲",
        "٣" => "۳",
        "٤" => "۴",
        "٥" => "۵",
        "٦" => "۶",
        "٧" => "۷",
        "٨" => "۸",
        "٩" => "۹",
      }

      nums.each {|k, v|
        num.gsub!(k, v)
      }

      return num
    end

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
