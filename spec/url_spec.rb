# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian url normalizer methods' do
  it 'should normalize persian text fo use in url' do
    text = '«دونالد ترامپ» پیروز انتخابات ایالات متحده شد'
    normal = 'دونالد-ترامپ-پیروز-انتخابات-ایالات-متحده-شد'
    expect(Persian::Url.urlify(text)).to eq(normal)
  end
end
