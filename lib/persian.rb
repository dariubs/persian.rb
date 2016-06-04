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

    def self.num_to_char num

      if num.is_a? String
        num = num.to_i
      end

      if num == 0
        return "صفر"
      elsif num < 0
        return "منفی" + num_to_char(num.abs)
      end

      words = ""

      if(num/1000000000) > 0
        if words != ""
          words += " و "
        end

         words += num_to_char(num / 1000000000) + " " + "‌میلیارد"
         num %= 1000000000
      end

      if(num/1000000) > 0
        if words != ""
          words += " و "
        end

         words += num_to_char(num / 1000000) + " " + "میلیون"
         num %= 1000000
      end

        if(num/1000) > 0
          if words != ""
            words += " و "
          end

           words += num_to_char(num / 1000) + " " + "هزار"
           num %= 1000
        end

       if (num/100) > 0 then
         if words != ""
           words += " و "
         end

         hunds = {
           0 => "",
           1 => "صد",
           2 => "دویست",
           3 => "سیصد",
           4 => "چهارصد",
           5 => "پونصد",
           6 => "ششصد",
           7 => "هفتصد",
           8 => "هشتصد",
           9 => "نهصد"
         }
          words += hunds[(num / 100)]
          num %= 100
        end

        if num > 0
          if words != ""
            words += " و "
          end

          units = {
            0   => "",
            1   => "یک",
            2   => "دو",
            3   => "سه",
            4   => "چهار",
            5   => "پنج",
            6   => "شش",
            7   => "هفت",
            8   => "هشت",
            9   => "نه",
            10  => "ده",
            11  => "یازده",
            12  => "دوازده",
            13  => "سیزده",
            14  => "چهارده",
            15  => "پونزده",
            16  => "شونزده",
            17  => "هفده",
            18  => "هجده",
            19  => "نوزده"
          }

          tens = {
            0 => "",
            1 => "ده",
            2 => "بیست",
            3 => "سی",
            4 => "چهل",
            5 => "پنجاه",
            6 => "شصت",
            7 => "هفتاد",
            8 => "هشتاد",
            9 => "نود"
          }

          if num < 20
            words += units[num]
          else
            words += tens[num / 10]
            if (num%10) > 0
              if words != ""
                words += " و "
              end
              words += units[num%10]
            end
          end

        end

        words

    end

end
