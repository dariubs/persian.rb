# -*- coding: UTF-8 -*-

# Persian class :: Counters
class Persian
  def self.word_counter(text)
    list = basic_tokenizer(text)
    occurrence = Hash.new

    list.each{ |item|
      occurrence[item] += 1
    }

    occurrence
  end
end
