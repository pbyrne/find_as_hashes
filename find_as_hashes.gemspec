# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "find_as_hashes/version"

Gem::Specification.new do |s|
  s.name        = "find_as_hashes"
  s.version     = FindAsHashes::VERSION
  s.authors     = ["Patrick Byrne"]
  s.email       = ["patrick.byrne@tstmedia.com"]
  s.homepage    = "https://github.com/pbyrne/find_as_hashes"
  s.summary     = %q{Provides ActiveRecord methods to return results as attribute hashes rather than instantiated ActiveRecord objects.}
  s.description = %q{Provides ActiveRecord methods to return results as attribute hashes rather than instantiated ActiveRecord objects. Useful when working with very large sets of results to improve performance.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activerecord"
end
