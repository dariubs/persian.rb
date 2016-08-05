# -*- coding: UTF-8 -*-

class Persian
  def method_missing(method, *arg, &block)
    super(method, *arg, &block)
  end
end
