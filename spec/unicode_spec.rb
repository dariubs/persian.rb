# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character methods' do
  it 'should return unicode character from codepoint hex' do
    codepoint = 0x062B
    char = 'ث'

    expect(Persian::Unicode.codepoint_to_char(codepoint)).to eq(char)
  end

  it 'should return text between RIGHT-TO-LETF EMBEDDING(U+202B) and Pop Directional Format(U+202C)' do
    before = 'مست+'
    after = '‫مست+‬'
    expect(Persian::Unicode.rle(before)).to eq(after)
  end

  it 'should text between return LETF-TO-RIGHT EMBEDDING(U+202A) and Pop Directional Format(U+202C)' do
    before = 'من c++ بلدم'
    after = '‪من c++ بلدم‬'

    expect(Persian::Unicode.lre(before)).to eq(after)
  end
end
