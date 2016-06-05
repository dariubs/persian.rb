<p align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a2/Farsi.svg"
         height="130" alt="Persian">
</p>
<p align="center">
    <a href="https://travis-ci.org/goonia/persian">
        <img src="https://travis-ci.org/goonia/persian.svg?branch=master"
             alt="Build Status">
    </a>
    <a href="https://rubygems.org/gems/persian">
        <img src="https://img.shields.io/badge/gem-persian-orange.svg"
             alt="Ruby Gems">
    </a>

    <a href="https://rubygems.org/gems/persian">
        <img src="https://img.shields.io/gem/dv/persian/stable.svg?maxAge=2592000"
             alt="Ruby Gems downloads">
    </a>
</p>
<p align="center"><sup><strong> Ruby gem for working with Persian text. </strong></sup></p>



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

Persian.number("۱۰۰۰", { lang: "en" }) # output: "1000"
Persian.number("12345", { lang: "ar"}) # output: "١٢٣٤٥"
Persian.number("۱۰۰۰", { lang: "en", return: "int" }) # output: 1000

Persian.character("ملوك") # output: "ملوک"

```

License
-------
Released under the MIT License.
