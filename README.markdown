Adds methods to return attribute hashes rather than instantiated
ActiveRecord objects. This is useful when working with large sets of
records and you need the performance more than you need the convenience
of your ActiveRecord methods.

## Methods

Both methods assume that you've constructed some sort of ARel-style
query (e.g., regular queries like `Customer.where("balance" > 5000)` or
scopes like `User.active`).

The hashes that return are similar to the hash that returns with
[`ActiveRecord::Base#attributes`][attrs_method], except values are not
coerced (e.g., a tinyint column containing `1` will not be coerced into
`true`). Strings, dates, and numbers will return as their appropriate
Ruby object. Booleans will return the underlying representation and
serialized objects will return as strings.

* `all_as_hashes` performs the search that you've set up and returns the
  results as an array of hashes.
* `first_as_hash` performs the search that you've set up and returns a
  hash of the first matching record.

[attrs_method]:http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-i-attributes

## Examples

    > User.where(:email => nil).all_as_hashes
    => [
      {:id => 123, :name => "Joe User", :email => nil},
      {:id => 456, :name => "Jane User", :email => nil}
    ]

    > User.where(:email => nil).first_as_hash
    => {:id => 123, :name => "Joe User", :email => nil}

## Effects

These methods are not for everyday use, but for when speed of execution
is more important than convenience, like heavy-duty reporting or
processing lots of existing records.

In one example, looping through 36,400 User records and accessing an
attribute used 32% less memory and performed 17% quicker using
`all_as_hashes` over `all`.


