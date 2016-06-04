# -*- coding: UTF-8 -*-

class Persian

  def self.number num, opts = {:lang => "fa", :return => "string" }

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

end
