# -*- coding: UTF-8 -*-

# Persian class
class Persian
  def self.num_to_char(num, inner = false)
    num = Persian.number(num, lang: 'en', return: 'int') if num.is_a? String

    words = ''

    if ((num / 100) >= 0) && ((num / 100) < 10)

      if num < 10
        if (num == 0) && inner
          words += ''
        elsif inner
          words += ' و '
          words += @ones[num]
        else
          words += @ones[num]
        end

      elsif num < 20
        words += @teens[num - 10]
      elsif num < 100
        words += ' و ' if inner

        words += @decimal[num / 10] + num_to_char(num % 10, true)
      else
        words += ' و ' if inner

        words += @hundreds[num / 100] + num_to_char(num % 100, true)
      end
    else
      words += ' و ' if inner

      if (num.to_s.length % 3) != 0
        current_split = num.to_s[0..(num.to_s.length % 3 - 1).to_i]
        more_split = num.to_s.sub(current_split, '')
        words += num_to_char(current_split) + ' ' + @longscale[(num.to_s.length / 3)] + num_to_char(more_split, true)
      else
        current_split = num.to_s[0..2]
        more_split = num.to_s.sub(current_split, '')
        words += num_to_char(current_split) + ' ' + @longscale[(num.to_s.length / 3) - 1] + num_to_char(more_split, true)
      end
    end

    words
  end
end
