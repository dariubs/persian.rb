# -*- coding: UTF-8 -*-

# Persian class :: characters
class Persian
  def self.number(num, opts = { lang: 'fa', return: 'string' })
    opts[:lang] = 'fa' if opts[:lang].nil?
    opts[:return] = 'string' if opts[:return].nil?
    num = num.to_s if num.is_a? Numeric

    if opts[:lang] == 'fa' || opts[:lang].nil?
      nums = @english_persian_numbers.merge(@arabic_persian_numbers)
    elsif opts[:lang] == 'en'
      nums = @persian_english_numbers.merge(@arabic_english_numbers)
    elsif opts[:lang] == 'ar'
      nums = @persian_arabic_numbers.merge(@english_arabic_numbers)
    end

    nums.each { |k, v| num.gsub!(k, v) }

    if opts[:return]
      case opts[:return]
      when 'string'
        num
      when 'int'
        num.to_i
      end
    else
      num
    end
  end

  def self.number_with_colon(num)
    num = number(num)
    num.reverse.gsub(/(\S{3})(?=\S)/, '\\1,').reverse
  end
end
