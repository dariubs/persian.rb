# -*- coding: UTF-8 -*-

# Persian Module
module Persian
  # Persian count class
  # Basic  counters for persian chars, texts, sentences and paragraphs
  class Counter
    def self.character(text, char = nil)
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

    def self.word(text, keyword = nil)
      list = Persian::Tokenizer.tokenize(text)
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

    def self.paragraph(text)
      list = Persian::Tokenizer.split_paragraphs text
      list.length
    end

    def self.uniq_character(text)
      text = text.split(//)
      text.uniq.size
    end
  end
end
