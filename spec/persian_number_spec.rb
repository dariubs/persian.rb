# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian number' do

  it 'should convert english numbers ( numeric ) to persian numbers' do
    expect(Persian.number(1000)).to eq('۱۰۰۰')
  end

  it 'should convert english numbers (string) to persian numbers' do
    expect(Persian.number('1234567890')).to eq('۱۲۳۴۵۶۷۸۹۰')
  end

  it 'should convert arabic numbers to persian numbers' do
    expect(Persian.number('٠١٢٣٤٥٦٧٨٩')).to eq('۰۱۲۳۴۵۶۷۸۹')
  end

  it 'should convert arabic and english numbers in strings to persian numbers' do
    expect(Persian.number('عدد 1 و ٥ دو عدد زیبا هستند')).to eq('عدد ۱ و ۵ دو عدد زیبا هستند')
  end

  it 'should convert english numbers ( numeric ) to arabic numbers' do
    expect(Persian.number(1000, {lang: 'ar'} )).to eq('١٠٠٠')
  end

  it 'should convert english numbers (string) to arabic numbers' do
    expect(Persian.number('1234567890', {lang: 'ar'} )).to eq('١٢٣٤٥٦٧٨٩٠')
  end

  it 'should convert persian numbers to arabic numbers' do
    expect(Persian.number('۰۱۲۳۴۵۶۷۸۹', {lang: 'ar'} )).to eq('٠١٢٣٤٥٦٧٨٩')
  end

  it 'should convert persian and english numbers in strings to arabic numbers' do
    expect(Persian.number('عدد 1 و ۵ دو عدد زیبا هستند', {lang: 'ar'} )).to eq('عدد ١ و ٥ دو عدد زیبا هستند')
  end

  it 'should convert english numbers ( numeric ) to english numbers (string)' do
    expect(Persian.number(1000, {lang: 'en'} )).to eq('1000')
  end

  it 'should convert arabic numbers (string) to english numbers' do
    expect(Persian.number('١٢٣٤٥٦٧٨٩٠', {lang: 'en'} )).to eq('1234567890')
  end

  it 'should convert persian numbers to english numbers' do
    expect(Persian.number('۰۱۲۳۴۵۶۷۸۹', {lang: 'en'} )).to eq('0123456789')
  end

  it 'should convert persian and arabic numbers in strings to english numbers' do
    expect(Persian.number('عدد ۱ و ٥ دو عدد زیبا هستند', {lang: 'en'} )).to eq('عدد 1 و 5 دو عدد زیبا هستند')
  end

  it 'should convert english numbers ( numeric ) to english numbers (int)' do
    expect(Persian.number(1000, {lang: 'en', return: 'int'} )).to eq(1000)
  end

  it 'should convert arabic numbers (string) to english numbers (int)' do
    expect(Persian.number('١٢٣٤٥٦٧٨٩٠', {lang: 'en', return: 'int'} )).to eq(1234567890)
  end

  it 'should convert persian numbers to english numbers (int)' do
    expect(Persian.number('۰۱۲۳۴۵۶۷۸۹', {lang: 'en', return: 'int'} )).to eq(123456789)
  end
end
