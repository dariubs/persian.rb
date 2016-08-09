# -*- coding: UTF-8 -*-

# Persian module
module Persian
  # Persian Number class
  class Number
    def self.number(num, opts = { lang: 'fa', return: 'string' })
      opts[:lang] = 'fa' if opts[:lang].nil?
      opts[:return] = 'string' if opts[:return].nil?
      num = num.to_s if num.is_a? Numeric

      if opts[:lang] == 'fa' || opts[:lang].nil?
        nums = EN_FA_NUM.merge(AR_FA_NUM)
      elsif opts[:lang] == 'en'
        nums = FA_EN_NUM.merge(AR_EN_NUM)
      elsif opts[:lang] == 'ar'
        nums = FA_AR_NUM.merge(EN_AR_NUM)
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
end
