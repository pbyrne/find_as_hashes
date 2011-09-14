require "find_as_hashes/version"

module ActiveRecord
  module FinderMethods
    def all_as_hashes
      connection.select_all(to_sql)
    end

    def first_as_hash
      connection.select_one(limit(1).to_sql)
    end
  end
end
