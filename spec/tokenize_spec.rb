# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian tokenizers' do
  it 'should return list of words and special persian characters ' do
    before = 'آیا روزی به اسرار این اتفاقات ماوراء طبیعی، این انعکاس سایهٔ روح که در حالت اغماء و برزخ بین خواب و بیداری جلوه می‌کند کسی پی خواهد برد؟'
    after = ['آیا', 'روزی', 'به', 'اسرار', 'این', 'اتفاقات', 'ماوراء', 'طبیعی', '،', 'این', 'انعکاس', 'سایهٔ', 'روح', 'که', 'در', 'حالت', 'اغماء', 'و', 'برزخ', 'بین', 'خواب', 'و', 'بیداری', 'جلوه', 'می‌کند', 'کسی', 'پی', 'خواهد', 'برد', '؟']

    expect(Persian.basic_tokenizer(before)).to eq(after)
  end
end
