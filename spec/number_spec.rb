# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian number methods' do
  it 'should convert english numbers ( numeric ) to persian numbers' do
    before = 1_000
    after = '۱۰۰۰'
    expect(Persian.number(before)).to eq(after)
  end

  it 'should convert english numbers (string) to persian numbers' do
    before = '1234567890'
    after = '۱۲۳۴۵۶۷۸۹۰'
    expect(Persian.number(before)).to eq(after)
  end

  it 'should convert arabic numbers to persian numbers' do
    before = '٠١٢٣٤٥٦٧٨٩'
    after = '۰۱۲۳۴۵۶۷۸۹'
    expect(Persian.number(before)).to eq(after)
  end

  it 'should convert arabic and english numbers in strings to persian numbers' do
    before = 'عدد 1 و ٥ دو عدد زیبا هستند'
    after = 'عدد ۱ و ۵ دو عدد زیبا هستند'
    expect(Persian.number(before)).to eq(after)
  end

  it 'should convert english numbers ( numeric ) to arabic numbers' do
    before = 1_000
    after = '١٠٠٠'
    expect(Persian.number(before, lang: 'ar')).to eq(after)
  end

  it 'should convert english numbers (string) to arabic numbers' do
    before = '1234567890'
    after = '١٢٣٤٥٦٧٨٩٠'
    expect(Persian.number(before, lang: 'ar')).to eq(after)
  end

  it 'should convert persian numbers to arabic numbers' do
    before = '۰۱۲۳۴۵۶۷۸۹'
    after = '٠١٢٣٤٥٦٧٨٩'
    expect(Persian.number(before, lang: 'ar')).to eq(after)
  end

  it 'should convert persian and english numbers in strings to arabic numbers' do
    before = 'عدد 1 و ۵ دو عدد زیبا هستند'
    after = 'عدد ١ و ٥ دو عدد زیبا هستند'
    expect(Persian.number(before, lang: 'ar')).to eq(after)
  end

  it 'should convert english numbers ( numeric ) to english numbers (string)' do
    before = 1_000
    after = '1000'
    expect(Persian.number(before, lang: 'en')).to eq(after)
  end

  it 'should convert arabic numbers (string) to english numbers' do
    before = '١٢٣٤٥٦٧٨٩٠'
    after = '1234567890'
    expect(Persian.number(before, lang: 'en')).to eq(after)
  end

  it 'should convert persian numbers to english numbers' do
    before = '۰۱۲۳۴۵۶۷۸۹'
    after = '0123456789'
    expect(Persian.number(before, lang: 'en')).to eq(after)
  end

  it 'should convert persian and arabic numbers in strings to english numbers' do
    before = 'عدد ۱ و ٥ دو عدد زیبا هستند'
    after = 'عدد 1 و 5 دو عدد زیبا هستند'
    expect(Persian.number(before, lang: 'en')).to eq(after)
  end

  it 'should convert english numbers ( numeric ) to english numbers (int)' do
    before = 1000
    after = 1_000
    expect(Persian.number(before, lang: 'en', return: 'int')).to eq(after)
  end

  it 'should convert arabic numbers (string) to english numbers (int)' do
    before = '١٢٣٤٥٦٧٨٩٠'
    after = 1_234_567_890
    expect(Persian.number(before, lang: 'en', return: 'int')).to eq(after)
  end

  it 'should convert persian numbers to english numbers (int)' do
    before = '۰۱۲۳۴۵۶۷۸۹'
    after = 123_456_789
    expect(Persian.number(before, lang: 'en', return: 'int')).to eq(after)
  end
end