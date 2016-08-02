# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character methods' do
  it 'should convert arbaic characters to persian characters' do
    before = 'ملوك'
    after = 'ملوک'
    expect(Persian.character(before)).to eq(after)
  end

  it 'should remove redundent spaces in strings' do
    before = 'سلام من به تو یار                          قدیمی'
    after = 'سلام من به تو یار قدیمی'
    expect(Persian.remove_extra_spaces(before)).to eq(after)
  end

  it 'should remove all arabic harekats from strings' do
    before = 'مَتَی ما تَلْقَ مَنْ تَهْوَی دَعِ الدُّنیا وأهْْمِلْها'
    after = 'متی ما تلق من تهوی دع الدنیا وأهملها'
    expect(Persian.remove_harekats(before)).to eq(after)
  end

  it 'should replace [ & ], { & }, ( & ), " & " with « & »' do
    before_first = 'اگر اراده ای نباشد عشقی نیست. "گاندی"'
    after_first = 'اگر اراده ای نباشد عشقی نیست. «گاندی»'

    before_second = 'اگر اراده ای نباشد عشقی نیست. [گاندی]'
    after_second = 'اگر اراده ای نباشد عشقی نیست. «گاندی»'

    before_third = 'اگر اراده ای نباشد عشقی نیست. (گاندی)'
    after_third = 'اگر اراده ای نباشد عشقی نیست. «گاندی»'

    before_forth = 'اگر اراده ای نباشد عشقی نیست. {گاندی}'
    after_forth = 'اگر اراده ای نباشد عشقی نیست. «گاندی»'

    expect(Persian.general_brackets(before_first)).to eq(after_first)
    expect(Persian.general_brackets(before_second)).to eq(after_second)
    expect(Persian.general_brackets(before_third)).to eq(after_third)
    expect(Persian.general_brackets(before_forth)).to eq(after_forth)
  end

  it 'should replace "&" with ( & )' do
    before = 'اگر اراده ای نباشد عشقی نیست. "گاندی"'
    after = 'اگر اراده ای نباشد عشقی نیست. (گاندی)'
    expect(Persian.general_brackets(before, '(', ')')).to eq(after)
  end

  it 'should add ی after names that ends with ا, و, ه' do
    before_first = 'داریوش'
    after_first = 'داریوش'

    before_second = 'حیفا'
    after_second = 'حیفا‌ی'

    before_third = 'الهه'
    after_third = 'الهه‌ی'

    expect(Persian.fix_y_after_vowel(before_first)).to eq(after_first)
    expect(Persian.fix_y_after_vowel(before_second)).to eq(after_second)
    expect(Persian.fix_y_after_vowel(before_third)).to eq(after_third)
  end

  it 'should replace english characters with it\'s same key persian characters on keyboard' do
    before = ';ajd k,p'
    after = 'کشتی نوح'
    expect(Persian.english_to_persian_char(before)).to eq(after)
  end

  it 'should replace persian characters with it\'s same key english characters on keyboard' do
    before = 'لخخلمث.زخپ'
    after = 'google.com'
    expect(Persian.persian_to_english_char(before)).to eq(after)
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

  it 'should remove stopwords from text' do
    before = 'چوب در آب افتاد'
    after = 'چوب آب افتاد'

    expect(Persian.remove_stopwords(before)).to eq(after)
  end

  it 'should remove space before noghtevirgool' do
    before = 'تصور برخی از اعضای انجمن نسبت به تهران کاملا متفاوت با قبل شده است ؛ آنها فکر می‌کردند که تهران یک بیابان و منطقه‌ای بی امکانات است.'
    after = 'تصور برخی از اعضای انجمن نسبت به تهران کاملا متفاوت با قبل شده است؛ آنها فکر می‌کردند که تهران یک بیابان و منطقه‌ای بی امکانات است.'

    expect(Persian.remove_space_noghtevirgool(before)).to eq(after)
  end

  it 'should remove extra persian signs after noghtevirgool' do
    before = 'آهان این شد؛!'
    after = 'آهان این شد؛'

    expect(Persian.remove_signs_after_noghtevirgool(before)).to eq(after)
  end

  it 'should add space after noghtevirgool' do
    before = 'آهان این شد؛بیا بریم'
    after = 'آهان این شد؛ بیا بریم'

    expect(Persian.space_after_noghtevirgool(before)).to eq(after)
  end

  it 'should replace noghtevirgool`s at the end of paragraphs with dot' do
    before_first = 'این آخر کار است؛'
    after_first = 'این آخر کار است.'

    expect(Persian.remove_noghtevirgool_para_end(before_first)).to eq(after_first)
  end

  it 'should remove noghtevirgool after brackets' do
    before = 'این یک مثال(؛برای تست) است'
    after = 'این یک مثال(برای تست) است'

    expect(Persian.remove_noghtevirgool_baz_start(before)).to eq(after)
  end

  it 'should remove spaces before virgool' do
    before = 'لئوناردو یک نقاش پرکار نبود ، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'
    after = 'لئوناردو یک نقاش پرکار نبود، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'

    expect(Persian.remove_space_before_virgool(before)).to eq(after)
  end

  it 'should remove extra signs after virgool' do
    before = 'لئوناردو یک نقاش پرکار نبود، !در حقیقت او پرکارترین نقشه‌کش و طراح بود.'
    after = 'لئوناردو یک نقاش پرکار نبود، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'

    expect(Persian.remove_signs_after_virgool(before)).to eq(after)
  end
end
