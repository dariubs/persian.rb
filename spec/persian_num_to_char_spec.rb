# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character' do
  it 'should convert english numbers to spelled persian character' do
    expect(Persian.num_to_char(1234)).to eq('یک هزار و دویست و سی و چهار')
  end

  it 'should convert Persian numbers to spelled persian number' do
    expect(Persian.num_to_char('۲۰۴۸۲۰۴۸')).to eq('بیست میلیون و چهارصد و هشتاد و دو هزار و چهل و هشت')
  end
end
