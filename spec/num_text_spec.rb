# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian number to character methods' do
  it 'should convert english numbers to spelled persian character' do
    before = 1234
    after = 'یک هزار و دویست و سی و چهار'
    expect(Persian::NumText.num_to_char(before)).to eq(after)
  end

  it 'should convert Persian numbers to spelled persian number' do
    before = '۲۰۴۸۲۰۴۸'
    after = 'بیست میلیون و چهارصد و هشتاد و دو هزار و چهل و هشت'
    expect(Persian::NumText.num_to_char(before)).to eq(after)
  end
end
