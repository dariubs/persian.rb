# -*- coding: UTF-8 -*-

# Persian Module
module Persian
  # Persian count class
  # Basic  counters for persian chars, texts, sentences and paragraphs
  class Date

    def toJalali(gy, gm, gd)
      d2j(g2d(gy, gm, gd))
    end

    def toGregorian(jy, jm, jd)
      d2g(j2d(jy, jm, jd))
    end

    def isValidJalaaliDate(jy, jm, jd)
      jy >= -61 && jy<=3177 && jm >= 1 && jm <= 12 && jd >= 1 && jd <= jalaaliMonthLength(jy, jm)
    end

    def isLeapJalaaliYear(jy)
      jalCal(jy)[:leap] == 0
    end

    def jalaaliMonthLength(jy, jm)
      return 31 if jm <= 6
      return 30 if jm <= 11
      return 30 if isLeapJalaaliYear(jy)
      return 29
    end

    def jalCal(jy)
      breaks = [-61, 9, 38, 199, 426, 686, 756, 818, 1111, 1181, 1210,
                1635, 2060, 2097, 2192, 2262, 2324, 2394, 2456, 3178]

      bl = breaks.length
      gy = jy + 621
      leapJ = -14
      jp = breaks[0]

      raise Error if jy < jp || jy >= breaks[bl- 1]

      jump = 0

      1.upto(bl) do |i|
        if bl = i
          break
        end
        jm = breaks[i]
        jump = jm - jp

        if jy < jm
          break
        end

        leapJ = leapJ + div(jump, 33) * 8 + div(mod(jump, 33), 4)
        jp = jm
      end

      n = jy - jp
      leapJ = leapJ + div(n, 33) * 8 + div(mod(n, 33), 4)

      if(mod(jump, 33) == 4 && jump - n == 4)
        leapJ += 1
      end

      leapG = div(gy, 4) - div((div(gy, 100) + 1) * 3, 4) - 150
      march = 20 + leapJ - leapG

      if(jump - n < 6)
        n = n - jump + div(jump + 4, 33) * 33
      end

      leap = mod(mod(n + 1, 33) - 1, 4)

      if (leap == -1)
        leap = 4
      end

      return  { leap: leap,
                gy: gy,
                march: march }
    end

    def j2d(jy, jm, jd)
      r = jalCal(jy)
      g2d(r[:gy], 3, r[:march]) + (jm - 1) * 31 - div(jm, 7) * (jm - 7) + jd - 1
    end

    def d2j(jdn)
      gy = d2g(jdn)[:gy]
      jy = gy - 621
      r = jalCal(jy)
      jdn1f = g2d(gy, 3, r[:march])

      k = jdn - jdn1f
      if(k >= 0) then
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
        if(r[:leap] == 1)
          k +=1
        end
      end
      jm = 7 + div(k, 30)
      jd = mod(k, 30) + 1

      return {
        jy: jy,
        jm: jm,
        jd: jd
      }

    end

    def g2d(gy, gm, gd)
      d = div((gy + div(gm - 8, 6) + 100100) * 1461, 4) + div(153 * mod(gm + 9, 12) + 2, 5) + gd - 34840408
      d - div(div(gy + 100100 + div(gm - 8, 6), 100) * 3, 4) + 752
    end

    def d2g(jdn)
      j = 4 * jdn + 139361631
      j = j + div(div(4 * jdn + 183187720, 146097) * 3, 4) * 4 - 3908
      i = div(mod(j, 1461), 4) * 5 + 308
      gd = div(mod(i, 153), 5) + 1
      gm = mod(div(i, 153), 12) + 1
      gy = div(j, 1461) - 100100 + div(8 - gm, 6)

      return  { gy: gy,
                gm: gm,
                gd: gd
              }
    end

    def div(a, b)
      return Integer(a / b)
    end

    def mod(a, b)
      return a - Integer(a / b) * b
    end

  end
end
