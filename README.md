# Scottie

型制約付きのaccessorを作成するgemです。

type_constraintsを使用します。

## Synopsis

```ruby
require 'scottie'
require 'type_constraints'

TypeConstraints.setup do
  subtype :NotNgWord, :String do
    constraint -> v { v !~ /悪/ }
  end
end

class Person
  has name: :NotNgWord, twitter_acount: :String
end

# ok
person = Person.new
person.name = "ひさいち"
person.twitter_acount = "hisaichi5518"

# throw exception
# person.name = "悪魔ちゃん"
# person.twitter_acount = :hisaichi5518

# ok
p person.name #=> "ひさいち"
p person.twitter_acount #=> "hisaichi5518"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scottie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scottie

## See also

- [type_constraints](https://github.com/hisaichi5518/type_constraints/)

## Contributing

1. Fork it ( https://github.com/hisaichi5518/scottie/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
