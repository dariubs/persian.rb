# -*- coding: UTF-8 -*-

class Persian

  def self.number num, opts = {:lang => "fa", :return => "string"}

    if opts[:lang] == nil
      opts[:lang] = "fa"
    end

    if opts[:return] == nil
      opts[:return] = "string"
    end

    if num.is_a? Numeric
      num = num.to_s
    end

    if opts[:lang] == "fa" || opts[:lang] == nil
      nums = @english_persian_numbers.merge(@arabic_persian_numbers)
    elsif opts[:lang] == "en"
      nums = @persian_english_numbers.merge(@arabic_english_numbers)
    elsif opts[:lang] == "ar"
      nums = @persian_arabic_numbers.merge(@english_arabic_numbers)
    end

    nums.each {|k, v|
      num.gsub!(k, v)
    }

    if opts[:return] == "string"
      return num
    elsif opts[:return] == "int"
      return num.to_i
    else
      return num
    end
  end

  def self.number_with_colon num
    num = self.number(num)
    num = num.reverse.gsub(/(\S{3})(?=\S)/, '\\1,').reverse
  end

end
