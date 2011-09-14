require 'test/unit'
require 'turn'
require 'shoulda'
require 'active_record'
require 'active_record/fixtures'
require 'sqlite3'
require 'find_as_hashes'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'
ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.string :name
    t.date :birthday
    t.boolean :active
  end
end

class User < ActiveRecord::Base
end

Fixtures.create_fixtures "test/fixtures", :users
