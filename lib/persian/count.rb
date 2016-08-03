# -*- coding: UTF-8 -*-

# Persian class :: Counters
class Persian
  def self.char_counter(text, char = nil)
    list = text.split(//)
    occurrence = {}
    occurrence.default = 0

    list.each do |item|
      occurrence[item] += 1
    end

    if char.nil?
      occurrence
    else
      occurrence[char]
    end
  end

  def self.word_counter(text, keyword = nil)
    list = basic_tokenizer(text)
    occurrence = {}
    occurrence.default = 0

    list.each do |item|
      occurrence[item] += 1
    end

    if keyword.nil?
      occurrence
    else
      occurrence[keyword]
    end
  end

  def self.paragraph_counter(text)
    list = split_paragraphs text
    list.length
  end
end
