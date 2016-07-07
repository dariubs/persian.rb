# -*- coding: UTF-8 -*-

# Persian class
class Persian
  @arabic_to_persian_chars = {
    'ك' => 'ک',
    'دِ' => 'د',
    'بِ' => 'ب',
    'زِ' => 'ز',
    'ذِ' => 'ذ',
    'شِ' => 'ش',
    'سِ' => 'س',
    'ى' => 'ی',
    'ي' => 'ی',
    'ة' => 'ه',
    'هٔ' => 'ه'
  }

  @harekats = [
    'َ', # Ae
    'ِ', # E
    'ُ', # O
    'ً', # An
    'ٍ', # En
    'ٌ', # On
    'ْ', # Saken
    'ّ' # Tashdid
  ]

  @end_vowel = [
    'ه',
    'ا',
    'و'
  ]
end
