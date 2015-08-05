# Linear Regression Trend Calculator [![Build Status](https://travis-ci.org/zero-one-software/linear_regression_trend.svg)](https://travis-ci.org/zero-one-software/linear_regression_trend) [![Code Climate](https://codeclimate.com/github/zero-one-software/linear_regression_trend/badges/gpa.svg)](https://codeclimate.com/github/zero-one-software/linear_regression_trend)

This is a simple gem to help calculate linear regression trendlines for a given list of samples.

## Note

This gem was created [using this gist.](https://gist.github.com/scottsbaldwin/1733588) originally [authored by Scott Baldwin.](https://github.com/scottsbaldwin). Thanks dude.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linear_regression_trend'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linear_regression_trend

## Usage

```ruby
my_array_of_samples = [10, 14, 18, 22, 26]
trender = LinearRegressionTrend::Calculator.new(my_array_of_samples)

trended_samples = trender.trend     # => [array of trend points]
trend_slope     = trender.slope     # => 4
trend_intercept = trender.intercept # => 6
```

## Development

Check out the tests in the /spec dir, and also install iRuby notebook, and take a look at the live documentation in /doc.

## Contributing

1. Fork it ( https://github.com/zero-one-software/linear_regression_trend/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Add some tests
6. Create a new Pull Request
7. Do a happy dance
