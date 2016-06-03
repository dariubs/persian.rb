Persian
=====
[![Build Status](https://travis-ci.org/goonia/persian.svg?branch=master)](https://travis-ci.org/goonia/persian) [![Ruby Gems](https://img.shields.io/badge/gem-persian-orange.svg)](https://rubygems.org/gems/persian)

Description
-----------
A set of utilities for Persian text.

Install
-----
```shell
gem install persian
```

Usage
-----------------------
```ruby
require 'persian'

Persian.number(1000) # output: ۱۰۰۰
Persian.number("روبی در سال 1993 توسط متز معرفی شد.") # output: "روبی در سال ۱۹۹۳ توسط متز معرفی شد."

Persian.character("ملوك") # output: "ملوک"

```

License
-------
Released under the MIT License.
