# Cerise::Rubocop

RuboCop support for [Hanami applications](https://github.com/hanami/hanami)

## Installation

Add this line to your application's Gemfile:

```rb
group :cli do
  gem "cerise-rubocop"
end
```

## Usage

`$ hanami install` will copies initial RuboCop configuration files.

- .rubocop - default command line options
- .rubocop.yml - configuration in YAML

This gem defines following Rake tasks provided by RuboCop.

- rubocop - Run RuboCop
- rubocop:autocorrect - Autocorrect RuboCop offenses (only when it's safe)
- rubocop:autocorrect:all - Autocorrect RuboCop offenses (safe and unsafe)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
