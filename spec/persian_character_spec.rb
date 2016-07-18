# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character methods' do
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

  it 'should split paragraphs' do
    text = "
یوهانس برامس در سال ۱۸۳۳ در شهر هامبورگ آلمان در خانواده‌ای فقیر به دنیا آمد. تحصیلات ابتدایی موسیقی را نزد پدرش که نوازنده کنترباس بود فرا گرفت.
برامس با ویولونیست‌های مشهوری چون رمنی و یواخیم آشنا شد و در طول این آشنایی بود که رمنی موسیقی محلی مجارستان را به برامس معرفی کرد و تحت تأثیر آن برامس رقص‌های مجار خود را نوشت.
"
    result = ['یوهانس برامس در سال ۱۸۳۳ در شهر هامبورگ آلمان در خانواده‌ای فقیر به دنیا آمد. تحصیلات ابتدایی موسیقی را نزد پدرش که نوازنده کنترباس بود فرا گرفت.',
              'برامس با ویولونیست‌های مشهوری چون رمنی و یواخیم آشنا شد و در طول این آشنایی بود که رمنی موسیقی محلی مجارستان را به برامس معرفی کرد و تحت تأثیر آن برامس رقص‌های مجار خود را نوشت.']

    expect(Persian.paragraph(text)).to eq(result)
  end

  it 'should replace space with zwnj after می and نمی' do
    mi_before = 'بچه ها نگاه می کنند'
    mi_after = 'بچه ها نگاه می‌کنند'

    nmi_before = 'هنوز واژه‌ها درد را نمی فهمند.'
    nmi_after = 'هنوز واژه‌ها درد را نمی‌فهمند.'

    expect(Persian.replace_zwnj_mi(mi_before)).to eq(mi_after)
    expect(Persian.replace_zwnj_mi(nmi_before)).to eq(nmi_after)
  end

  it 'should Resplace ست with \sاست if lastest character before \s is ا' do
    first_before = 'امروز، فردا است.'
    first_after = 'امروز، فرداست.'

    second_before = 'نام او علی است.'
    second_after = 'نام او علی است.'

    expect(Persian.ast(first_before)).to eq(first_after)
    expect(Persian.ast(second_before)).to eq(second_after)
  end

  it 'should remove keshide characters' do
    before = 'سلـــــــــــــــــــام چطوری؟'
    after = 'سلام چطوری؟'
    expect(Persian.keshide(before)).to eq(after)
  end

  it 'should replace ئ with ی if next character is ی' do
    before = 'پائیز'
    after = 'پاییز'
    expect(Persian.replace_e_y(before)).to eq(after)
  end

  it 'should replace 3 or more dots (.) with (…) character' do
    before = 'خدانگهدار...'
    after = 'خدانگهدار…'
    expect(Persian.three_dots(before)).to eq(after)
  end

  it 'should fix zwnj for تر - تری - ترین - ها - های suffixes' do
    before = 'آن زیبا ترین رویا'
    after = 'آن زیبا‌ترین رویا'
    expect(Persian.suffix(before)).to eq(after)
  end

  it 'should remove extra persian question marks' do
    before = 'چی؟؟؟؟'
    after = 'چی؟'
    expect(Persian.remove_extra_question_mark(before)).to eq(after)
  end

  it 'should add zero-width none-joiner to specific index in string' do
    before = 'دوستهایم'
    after = 'دوست‌هایم'
    expect(Persian.add_zwnj(before, 4)).to eq(after)
  end

  it 'should remove extra question and exclamation marks' do
    before = 'نه بابا ؟؟!!!!!!!!!!!!!'
    after = 'نه بابا ؟!'

    expect(Persian.remove_question_exclamation(before)).to eq(after)
  end
end
