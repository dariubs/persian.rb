# -*- coding: UTF-8 -*-

# Persian module
module Persian
  # Persian Unicode class
  class Unicode
    def self.codepoint_to_char(char)
      return [char].pack('U') if char.is_a? Fixnum
      [char.hex].pack('U')
    end

    # Return text between RIGHT-TO-LETF EMBEDDING(U+202B) and Pop Directional Format(U+202C)
    def self.rle(text)
      lre_tag = 0x202B
      pop_tag = 0x202C

      codepoint_to_char(lre_tag) + text + codepoint_to_char(pop_tag)
    end

    # Return text between LETF-TO-RIGHT EMBEDDING(U+202A) and Pop Directional Format(U+202C)
    def self.lre(text)
      rle_tag = 0x202A
      pop_tag = 0x202C

      codepoint_to_char(rle_tag) + text + codepoint_to_char(pop_tag)
    end

    def self.rlo(text)
      lro_tag = 0x202E
      pop_tag = 0x202C

      codepoint_to_char(lro_tag) + text + codepoint_to_char(pop_tag)
    end

    def self.lro(text)
      rlo_tag = 0x202D
      pop_tag = 0x202C

      codepoint_to_char(rlo_tag) + text + codepoint_to_char(pop_tag)
    end
  end
end
