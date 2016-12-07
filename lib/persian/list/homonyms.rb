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

    # List of all Homonyms classified in a hash
    ALL = {
      T: T,
      S: S,
      H: H,
      Z: Z,
      GH: GH
    }.freeze

    # List of all Homonyms bulk in array
    ALL_a = [
      T, S, H, Z, GH
    ].flatten.freeze

    # Hash reverse list of Homonyms
    temp = {}

    ALL.each do |key, value|
      value.each do |i|
        temp[i.to_s] = key
      end
    end

    ALL_r = temp.freeze
  end
end
