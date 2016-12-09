# -*- coding: UTF-8 -*-

# Persian module
module Persian
  # Persian tokenize class
  class Tokenizer
    # Basic persian word tokenizer
    # Return an array of words
    def self.tokenize(text)
      symbols = ['!', '﷼', ':', '؛', '؟', '،', '-', '.']
      pair_pre = ['(', '{', '«', '<', '[']
      pair_post = [')', '}', '»', '>', ']']
      prepost = ["'", '"']

      # Split text with space characters
      splits = text.split(/\s/)

      return [''] if splits.empty?

      options = symbols + pair_pre + pair_post + prepost

      pattern = /[^#{Regexp.escape(options.join)}]+/
      tokens = []

      splits.each do |split|
        first, middle, last = split.partition(pattern)
        tokens << first.split unless first.empty?
        tokens << middle unless middle.empty?
        tokens << last.split unless last.empty?
      end

      tokens.flatten
    end

    def self.tokenize_more(text, num)
      list = tokenize(text)
      tokens = []
      0.upto list.size - num do |i|
        token = ''
        0.upto num - 1 do |j|
          token += list[i + j] + ' '
        end
        tokens.push token.strip
      end

      tokens
    end

    # Split paragraphs
    # Return an array of paragraphs
    def self.split_paragraphs(text)
      text = text.split("\n").reject(&:empty?)
      text
    end
  end
end
