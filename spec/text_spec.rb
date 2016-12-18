# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian character methods' do
  it 'should convert arbaic characters to persian characters' do
    before = 'ملوك'
    after = 'ملوک'
    expect(Persian::Text.character(before)).to eq(after)
  end

  it 'should remove redundent spaces in strings' do
    before = 'سلام من به تو یار                          قدیمی'
    after = 'سلام من به تو یار قدیمی'
    expect(Persian::Text.remove_extra_spaces(before)).to eq(after)
  end

  it 'should remove all arabic harekats from strings' do
    before = 'مَتَی ما تَلْقَ مَنْ تَهْوَی دَعِ الدُّنیا وأهْْمِلْها'
    after = 'متی ما تلق من تهوی دع الدنیا وأهملها'
    expect(Persian::Text.remove_harekats(before)).to eq(after)
  end

  it 'should remove all brackets from text' do
    before = 'سلام من به «تو»'
    after = 'سلام من به تو'
    expect(Persian::Text.remove_brackets(before)).to eq(after)
  end

  it 'should remove all signs from text' do
    before = 'مسلمان و دروغ؟!'
    after = 'مسلمان و دروغ'
    expect(Persian::Text.remove_signs(before)).to eq(after)
  end

  it 'should replace all zwnjs with space ' do
    before = 'من‌در‌نیم‌فاصله‌ات‌اسیرم'
    after = 'من در نیم فاصله ات اسیرم'

    expect(Persian::Text.replace_zwnj_with_space(before)).to eq(after)
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

    expect(Persian::Text.general_brackets(before_first)).to eq(after_first)
    expect(Persian::Text.general_brackets(before_second)).to eq(after_second)
    expect(Persian::Text.general_brackets(before_third)).to eq(after_third)
    expect(Persian::Text.general_brackets(before_forth)).to eq(after_forth)
  end

  it 'should replace "&" with ( & )' do
    before = 'اگر اراده ای نباشد عشقی نیست. "گاندی"'
    after = 'اگر اراده ای نباشد عشقی نیست. (گاندی)'
    expect(Persian::Text.general_brackets(before, '(', ')')).to eq(after)
  end

  it 'should add ی after names that ends with ا, و, ه' do
    before_first = 'داریوش'
    after_first = 'داریوش'

    before_second = 'حیفا'
    after_second = 'حیفا‌ی'

    before_third = 'الهه'
    after_third = 'الهه‌ی'

    expect(Persian::Text.fix_y_after_vowel(before_first)).to eq(after_first)
    expect(Persian::Text.fix_y_after_vowel(before_second)).to eq(after_second)
    expect(Persian::Text.fix_y_after_vowel(before_third)).to eq(after_third)
  end

  it 'should replace english characters with it\'s same key persian characters on keyboard' do
    before = ';ajd k,p'
    after = 'کشتی نوح'
    expect(Persian::Text.english_to_persian_char(before)).to eq(after)
  end

  it 'should replace persian characters with it\'s same key english characters on keyboard' do
    before = 'لخخلمث.زخپ'
    after = 'google.com'
    expect(Persian::Text.persian_to_english_char(before)).to eq(after)
  end

  it 'should replace space with zwnj after می and نمی' do
    mi_before = 'بچه ها نگاه می کنند'
    mi_after = 'بچه ها نگاه می‌کنند'

    nmi_before = 'هنوز واژه‌ها درد را نمی فهمند.'
    nmi_after = 'هنوز واژه‌ها درد را نمی‌فهمند.'

    expect(Persian::Text.replace_zwnj_mi(mi_before)).to eq(mi_after)
    expect(Persian::Text.replace_zwnj_mi(nmi_before)).to eq(nmi_after)
  end

  it 'should Resplace ست with \sاست if lastest character before \s is ا' do
    first_before = 'امروز، فردا است.'
    first_after = 'امروز، فرداست.'

    second_before = 'نام او علی است.'
    second_after = 'نام او علی است.'

    expect(Persian::Text.ast(first_before)).to eq(first_after)
    expect(Persian::Text.ast(second_before)).to eq(second_after)
  end

  it 'should remove keshide characters' do
    before = 'سلـــــــــــــــــــام چطوری؟'
    after = 'سلام چطوری؟'
    expect(Persian::Text.keshide(before)).to eq(after)
  end

  it 'should replace ئ with ی if next character is ی' do
    before = 'پائیز'
    after = 'پاییز'
    expect(Persian::Text.replace_e_y(before)).to eq(after)
  end

  it 'should replace 3 or more dots (.) with (…) character' do
    before = 'خدانگهدار...'
    after = 'خدانگهدار…'
    expect(Persian::Text.three_dots(before)).to eq(after)
  end

  it 'should fix zwnj for تر - تری - ترین - ها - های suffixes' do
    before = 'آن زیبا ترین رویا'
    after = 'آن زیبا‌ترین رویا'
    expect(Persian::Text.suffix(before)).to eq(after)
  end

  it 'should remove extra persian question marks' do
    before = 'چی؟؟؟؟'
    after = 'چی؟'
    expect(Persian::Text.remove_extra_question_mark(before)).to eq(after)
  end

  it 'should add zero-width none-joiner to specific index in string' do
    before = 'دوستهایم'
    after = 'دوست‌هایم'
    expect(Persian::Text.add_zwnj(before, 4)).to eq(after)
  end

  it 'should remove extra question and exclamation marks' do
    before = 'نه بابا ؟؟!!!!!!!!!!!!!'
    after = 'نه بابا ؟!'

    expect(Persian::Text.remove_question_exclamation(before)).to eq(after)
  end

  it 'should remove stopwords from text' do
    before = 'چوب در آب افتاد'
    after = 'چوب آب افتاد'

    expect(Persian::Text.remove_stopwords(before)).to eq(after)
  end

  it 'should remove space before noghtevirgool' do
    before = 'تصور برخی از اعضای انجمن نسبت به تهران کاملا متفاوت با قبل شده است ؛ آنها فکر می‌کردند که تهران یک بیابان و منطقه‌ای بی امکانات است.'
    after = 'تصور برخی از اعضای انجمن نسبت به تهران کاملا متفاوت با قبل شده است؛ آنها فکر می‌کردند که تهران یک بیابان و منطقه‌ای بی امکانات است.'

    expect(Persian::Text.remove_space_noghtevirgool(before)).to eq(after)
  end

  it 'should remove extra persian signs after noghtevirgool' do
    before = 'آهان این شد؛!'
    after = 'آهان این شد؛'

    expect(Persian::Text.remove_signs_after_noghtevirgool(before)).to eq(after)
  end

  it 'should add space after noghtevirgool' do
    before = 'آهان این شد؛بیا بریم'
    after = 'آهان این شد؛ بیا بریم'

    expect(Persian::Text.space_after_noghtevirgool(before)).to eq(after)
  end

  it 'should replace noghtevirgool`s at the end of paragraphs with dot' do
    before_first = 'این آخر کار است؛'
    after_first = 'این آخر کار است.'

    expect(Persian::Text.remove_noghtevirgool_para_end(before_first)).to eq(after_first)
  end

  it 'should remove noghtevirgool after brackets' do
    before = 'این یک مثال(؛برای تست) است'
    after = 'این یک مثال(برای تست) است'

    expect(Persian::Text.remove_noghtevirgool_baz_start(before)).to eq(after)
  end

  it 'should remove spaces before virgool' do
    before = 'لئوناردو یک نقاش پرکار نبود ، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'
    after = 'لئوناردو یک نقاش پرکار نبود، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'

    expect(Persian::Text.remove_space_before_virgool(before)).to eq(after)
  end

  it 'should remove extra signs after virgool' do
    before = 'لئوناردو یک نقاش پرکار نبود، !در حقیقت او پرکارترین نقشه‌کش و طراح بود.'
    after = 'لئوناردو یک نقاش پرکار نبود، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'

    expect(Persian::Text.remove_signs_after_virgool(before)).to eq(after)
  end

  it 'should add space after virgool if missing' do
    before = 'لئوناردو یک نقاش پرکار نبود،در حقیقت او پرکارترین نقشه‌کش و طراح بود.'
    after = 'لئوناردو یک نقاش پرکار نبود، در حقیقت او پرکارترین نقشه‌کش و طراح بود.'

    expect(Persian::Text.space_after_virgool(before)).to eq(after)
  end

  it 'should remove specific character from every words in text' do
    before = 'این برای پاک کردن نون است'
    char = 'ن'
    after = 'ای برای پاک کرد و است'

    expect(Persian::Text.rm_char(before, char)).to eq(after)
  end

  it 'should replace end of line virgool with dot' do
    text = 'جمله با ویرگول پایان نمیپذیرد،'
    after = 'جمله با ویرگول پایان نمیپذیرد.'

    expect(Persian::Text.rm_virgool_in_end(text)).to eq(after)
  end

  it 'should add space after dot\'s ends with no space character' do
    text = 'سلام.اسپیس کو؟'
    after = 'سلام. اسپیس کو؟'
    expect(Persian::Text.space_after_dot(text)).to eq(after)
  end

  it 'should remove all repeated characters from text' do
    text = 'سلااااااام.چی میکنییی؟؟؟؟؟'
    after = 'سلام.چی میکنی؟'

    expect(Persian::Text.squeeze(text)).to eq(after)
  end

  it 'should remove text postfix' do
    text = 'پسره'
    postfix = 'ه'
    result = 'پسر'

    expect(Persian::Text.remove_postfix(text, postfix)).to eq(result)
  end
end
