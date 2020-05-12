# `minitest-hooks` repro

This reproduces an issue where `minitest-hooks` expects `Minitest::Test.before` to be implemented, but it is only implemented in `Minitest::Spec`.

Out-of-the-box:

```
$ bundle exec ruby run.rb
/Users/bmorton/.rvm/gems/ruby-2.3.5/gems/minitest-hooks-1.5.0/lib/minitest/hooks/test.rb:118:in `before': super: no superclass method `before' for TestMeme:Class (NoMethodError)
	from run.rb:30:in `<class:TestMeme>'
	from run.rb:22:in `<main>'
```

With missing methods:

```
$ EXTEND_WITH_MISSING=true bundle exec ruby run.rb
Run options: --seed 3799

# Running:

before all!
before each!
.before each!
.

Finished in 0.001017s, 1966.5683 runs/s, 1966.5683 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```
