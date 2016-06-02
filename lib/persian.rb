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
end
