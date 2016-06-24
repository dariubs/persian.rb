# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character' do

  it 'should convert arbaic characters to persian characters' do
    expect(Persian.character('ملوك')).to eq('ملوک')
  end

end
