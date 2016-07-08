# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character' do
  it 'should convert arbaic characters to persian characters' do
    expect(Persian.character('ملوك')).to eq('ملوک')
  end

  it 'should remove redundent spaces in strings' do
    expect(Persian.remove_extra_spaces('سلام من به تو یار                          قدیمی')).to eq('سلام من به تو یار قدیمی')
  end

  it 'should remove all arabic harekats from strings' do
    expect(Persian.remove_harekats('مَتَی ما تَلْقَ مَنْ تَهْوَی دَعِ الدُّنیا وأهْْمِلْها')).to eq('متی ما تلق من تهوی دع الدنیا وأهملها')
  end

  it 'should replace [ & ], { & }, ( & ), " & " with « & »' do
    expect(Persian.general_brackets('اگر اراده ای نباشد عشقی نیست. "گاندی"')).to eq('اگر اراده ای نباشد عشقی نیست. «گاندی»')
    expect(Persian.general_brackets('اگر اراده ای نباشد عشقی نیست. [گاندی]')).to eq('اگر اراده ای نباشد عشقی نیست. «گاندی»')
    expect(Persian.general_brackets('اگر اراده ای نباشد عشقی نیست. (گاندی)')).to eq('اگر اراده ای نباشد عشقی نیست. «گاندی»')
    expect(Persian.general_brackets('اگر اراده ای نباشد عشقی نیست. {گاندی}')).to eq('اگر اراده ای نباشد عشقی نیست. «گاندی»')
  end

  it 'should replace "&" with ( & )' do
    expect(Persian.general_brackets('اگر اراده ای نباشد عشقی نیست. "گاندی"', '(', ')')).to eq('اگر اراده ای نباشد عشقی نیست. (گاندی)')
  end

  it 'should add ی after names that ends with ا, و, ه' do
    expect(Persian.fix_y_after_vowel('داریوش')).to eq('داریوش')
    expect(Persian.fix_y_after_vowel('حیفا')).to eq('حیفا‌ی')
    expect(Persian.fix_y_after_vowel('الهه')).to eq('الهه‌ی')
  end

  it 'should replace english characters with it\'s same key persian characters on keyboard' do
    expect(Persian.english_to_persian_char(';ajd k,p')).to eq('کشتی نوح')
  end

  it 'should replace persian characters with it\'s same key english characters on keyboard' do
    expect(Persian.persian_to_english_char('لخخلمث.زخپ')).to eq('google.com')
  end
end
