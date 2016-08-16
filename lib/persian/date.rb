# -*- coding: UTF-8 -*-

# Persian Module
module Persian
  # Persian count class
  # Basic  counters for persian chars, texts, sentences and paragraphs
  class Date
    def to_jalali(gy, gm, gd)
      d2j(g2d(gy, gm, gd))
    end

    def to_gregorian(jy, jm, jd)
      d2g(j2d(jy, jm, jd))
    end

    def valid_jalali_date?(jy, jm, jd)
      jy >= -61 && jy <= 3177 && jm >= 1 && jm <= 12 && jd >= 1 && jd <= jalali_month_length(jy, jm)
    end

    def leap_jalali_year?(jy)
      jal_cal(jy)[:leap].zero?
    end

    def jalali_month_length(jy, jm)
      return 31 if jm <= 6
      return 30 if jm <= 11
      return 30 if leap_jalali_year?(jy)
      29
    end

    def jal_cal(jy)
      breaks = [-61, 9, 38, 199, 426, 686, 756, 818, 1111, 1181, 1210,
                1635, 2060, 2097, 2192, 2262, 2324, 2394, 2456, 3178]

      bl = breaks.size
      gy = jy + 621
      leap_j = -14
      jp = breaks[0]

      raise Error if jy < jp || jy >= breaks[bl - 1]

      jump = nil

      1.upto(bl - 1) do |i|
        jm = breaks[i]
        jump = jm - jp

        break if jy < jm

        leap_j = leap_j + div(jump, 33) * 8 + div(mod(jump, 33), 4)
        jp = jm
      end

      n = jy - jp

      leap_j = leap_j + div(n, 33) * 8 + div(mod(n, 33), 4)

      leap_j += 1 if mod(jump, 33) == 4 && jump - n == 4

      leap_g = div(gy, 4) - div((div(gy, 100) + 1) * 3, 4) - 150

      march = 20 + leap_j - leap_g

      n = n - jump + div(jump + 4, 33) * 33 if jump - n < 6

      leap = mod(mod(n + 1, 33) - 1, 4)

      leap = 4 if leap == -1

      { leap: leap,
        gy: gy,
        march: march }
    end

    def j2d(jy, jm, jd)
      r = jal_cal(jy)
      g2d(r[:gy], 3, r[:march]) + (jm - 1) * 31 - div(jm, 7) * (jm - 7) + jd - 1
    end

    def d2j(jdn)
      gy = d2g(jdn)[:gy]
      jy = gy - 621
      r = jal_cal(jy)
      jdn1f = g2d(gy, 3, r[:march])

      k = jdn - jdn1f
      if k >= 0
        (
        if k <= 185
          jm = 1 + div(k, 31)
          jd = mod(k, 31) + 1
          return {
            jy: jy,
            jm: jm,
            jd: jd
          }
        else
          k -= 186
        end
        )
      else
        jy -= 1
        k += 179
        k += 1 if r[:leap] == 1
      end
      jm = 7 + div(k, 30)
      jd = mod(k, 30) + 1

      {
        jy: jy,
        jm: jm,
        jd: jd
      }
    end

    def g2d(gy, gm, gd)
      d = div((gy + div(gm - 8, 6) + 100_100) * 1_461, 4) + div(153 * mod(gm + 9, 12) + 2, 5) + gd - 34_840_408
      d - div(div(gy + 100_100 + div(gm - 8, 6), 100) * 3, 4) + 752
    end

    def d2g(jdn)
      j = 4 * jdn + 139_361_631
      j = j + div(div(4 * jdn + 183_187_720, 146_097) * 3, 4) * 4 - 3_908
      i = div(mod(j, 1_461), 4) * 5 + 308
      gd = div(mod(i, 153), 5) + 1
      gm = mod(div(i, 153), 12) + 1
      gy = div(j, 1_461) - 100_100 + div(8 - gm, 6)

      { gy: gy,
        gm: gm,
        gd: gd }
    end

    def div(a, b)
      tilde(a / b.to_f)
    end

    def mod(a, b)
      a - tilde(a / b.to_f) * b
    end

    def tilde(num)
      if num < 0
        num.ceil
      else
        num.floor
      end
    end
  end
end
