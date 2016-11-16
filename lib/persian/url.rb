# -*- coding: UTF-8 -*-

# Persian module
module Persian
  # Persian Unicode class
  class Url
    def self.urlify(text)
      # remove brackets
      text = Text.remove_brackets(text)
      # remove harekats
      text = Text.remove_harekats(text)
      # remove slash and backslash
      text.gsub!(%r{(\/||\\)}, '')
      # remove signs
      text = Text.remove_signs(text, ' ')
      # Remove extra spaces
      text = Text.remove_extra_spaces(text)
      # trim spaces from start and end of text
      text = text.strip
      # replace space with dash
      text.gsub!(/\s/, '-')
      text
    end
  end
end
