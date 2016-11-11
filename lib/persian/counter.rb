# -*- coding: UTF-8 -*-

# Persian Module
module Persian
  # Persian count class
  # Basic  counters for persian chars, texts, sentences and paragraphs
  class Counter
    # Return list a hash with list of characters in the text
    # Hash key is the character and Hash value is number of occurrence
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

    # Return number of uniq characters used in text
    def self.uniq_character(text)
      text = text.split(//)
      text.uniq.size
    end

    # Return how many character text is
    def self.character_counter(text)
      text.length
    end

    # Return list a hash with list of words in the text
    # Hash key is the word and Hash value is number of occurrence
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

    # Return number of paragraph in text
    def self.paragraph(text)
      list = Persian::Tokenizer.split_paragraphs text
      list.length
    end
  end
end
