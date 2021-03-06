# MemoryTestFix

A simple fix to run your Rails tests with sqlite. From the example at

http://blog.seagul.co.uk/articles/2006/02/08/in-memory-sqlite-database-for-rails-testing

Add the gem to your bundle by adding

```ruby
  gem 'memory_test_fix'
```

to your `Gemfile`


In your database.yml, use:

```yaml
  test:
    adapter: sqlite3
    database: ":memory:"
```

It runs much faster!

You can also adjust the verbosity of the output:

```yaml
  test:
    adapter: sqlite3
    database: ":memory:"
    verbosity: silent
```

To use rails migrations instead of loading `db/schema.rb`

```yaml
  test:
    adapter: sqlite3
    database: ":memory:"
    migrate: true
```

You can also use this with other (testing) environments, not just 'test'.

## Rails Versions

Due to incompatibilities in the loading of gem plugins by Rails, this gem
only works with Rails 3 starting from version 0.2.0. If you're using an
older version of Rails, use the 0.1.x version of this gem.

## Authors

Chris Roos

Adapted by Geoffrey Grosenbach, http://nubyonrails.com

Verbosity patch by Kakutani Shintaro

Adapted as GemPlugin by Matijs van Zuijlen

Support for environments besides 'test' by Erik Hanson & Matt Scilipoti

Support for Rails 3 by Greg Weber

Fix for Rails 3.2 by Stephan Zalewski
