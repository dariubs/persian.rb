# -*- coding: UTF-8 -*-

# Persian class
module Persian
  # Number class
  class Number
    include Alphabet

    EN_FA_NUM = {
      # english numbers
      ZERO    => SEFR,
      ONE     => YEK,
      TWO     => DOW,
      THREE   => SE,
      FOUR    => CHAHAR,
      FIVE    => PANJ,
      SIX     => SHESH,
      SEVEN   => HAFT,
      EIGHT   => HASHT,
      NINE    => NOH
    }.freeze

    FA_EN_NUM = {
      # english numbers
      SEFR    => ZERO,
      YEK     => ONE,
      DOW     => TWO,
      SE      => THREE,
      CHAHAR  => FOUR,
      PANJ    => FIVE,
      SHESH   => SIX,
      HAFT    => SEVEN,
      HASHT   => EIGHT,
      NOH     => NINE
    }.freeze

    AR_FA_NUM = {
      # arabic numbers
      SIFR    => SEFR,
      WAHID   => YEK,
      ATHNAN  => DOW,
      THALETH => SE,
      ARBE    => CHAHAR,
      KHAMSE  => PANJ,
      SETE    => SHESH,
      SABE    => HAFT,
      THMANY  => HASHT,
      LAYS    => NOH
    }.freeze

    FA_AR_NUM = {
      # arabic numbers
      SEFR    => SIFR,
      YEK     => WAHID,
      DOW     => ATHNAN,
      SE      => THALETH,
      CHAHAR  => ARBE,
      PANJ    => KHAMSE,
      SHESH   => SETE,
      HAFT    => SABE,
      HASHT   => THMANY,
      NOH     => LAYS
    }.freeze

    AR_EN_NUM = {
      SIFR    => ZERO,
      WAHID   => ONE,
      ATHNAN  => TWO,
      THALETH => THREE,
      ARBE    => FOUR,
      KHAMSE  => FIVE,
      SETE    => SIX,
      SABE    => SEVEN,
      THMANY  => EIGHT,
      LAYS    => NINE
    }.freeze

    EN_AR_NUM = {
      ZERO    => SIFR,
      ONE     => WAHID,
      TWO     => ATHNAN,
      THREE   => THALETH,
      FOUR    => ARBE,
      FIVE    => KHAMSE,
      SIX     => SETE,
      SEVEN   => SABE,
      EIGHT   => THMANY,
      NINE    => LAYS
    }.freeze

    ONES = [
      'صفر',
      'یک',
      'دو',
      'سه',
      'چهار',
      'پنج',
      'شش',
      'هفت',
      'هشت',
      'نه'
    ].freeze

    TEENS = [
      'ده',
      'یازده',
      'دوازده',
      'سیزده',
      'چهارده',
      'پانزده',
      'شانزده',
      'هفده',
      'هجده',
      'نوزده'
    ].freeze

    DECIMAL = [
      '',
      '',
      'بیست',
      'سی',
      'چهل',
      'پنجاه',
      'شصت',
      'هفتاد',
      'هشتاد',
      'نود'
    ].freeze

    HUNDREDS = [
      '',
      'صد',
      'دویست',
      'سیصد',
      'چهارصد',
      'پانصد',
      'ششصد',
      'هفتصد',
      'هشتصد',
      'نهصد'
    ].freeze

    LONGSCALE = [
      '',
      'هزار',
      'میلیون',
      'میلیارد',
      'بیلیون',
      'بیلیارد',
      'تریلیون',
      'تریلیارد',
      'کوآدریلیون',
      'کادریلیارد',
      'کوینتیلیون',
      'کوانتینیارد',
      'سکستیلیون',
      'سکستیلیارد',
      'سپتیلیون',
      'سپتیلیارد',
      'اکتیلیون',
      'اکتیلیارد',
      'نانیلیون',
      'نانیلیارد',
      'دسیلیون',
      'دسیلیارد'
    ].freeze
  end
end
