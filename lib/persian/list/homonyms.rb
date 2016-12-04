module Persian
  # Homonyms of persian
  module Homonyms
    include Alphabet

    T = [
      TE,
      TA
    ].freeze

    S = [
      THE,
      SIN,
      SAD
    ].freeze

    H = [
      HE_JIMI,
      HE_DOCHESHM
    ].freeze

    Z = [
      ZAL,
      ZE,
      ZA,
      ZAD
    ].freeze

    GH = [
      GHEIN,
      QAF
    ].freeze

    ALL = {
      T: T,
      S: S,
      H: H,
      Z: Z,
      GH: GH
    }.freeze
  end
end
