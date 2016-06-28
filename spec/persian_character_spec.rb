# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character' do
  it 'should convert arbaic characters to persian characters' do
    expect(Persian.character('ملوك')).to eq('ملوک')
  end

  it 'should remove redundent spaces in strings' do
    expect(Persian.remove_extra_spaces('سلام من به تو یار                          قدیمی')).to eq('سلام من به تو یار قدیمی')
  end
end
