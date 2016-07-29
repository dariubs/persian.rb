# -*- coding: UTF-8 -*-

# Persian class :: Counters
class Persian
  def self.word_counter(text)
    list = basic_tokenizer(text)
    occurrence = {}
    occurrence.default = 0

    list.each do |item|
      occurrence[item] += 1
    end

    occurrence
  end
end
