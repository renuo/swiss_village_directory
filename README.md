[![Build Status](https://travis-ci.org/renuo/swiss-village-directory.svg?branch=master)](https://travis-ci.org/renuo/swiss-village-directory)

# Swiss Village Directory

This gem provides a data set of all swiss villages taken out of the
"Ortschaftenverzeichnis" ([ch.swisstopo-vd.ortschaftenverzeichnis_plz][4])
The data set made available through a ruby object called [`Village`](https://github.com/renuo/swiss-village-directory/blob/master/lib/swiss_village_directory/village.rb) contains
the following fields.

* name
* zip_code
* one_digit_spare
* commune
* canton
* latitude (WGS84)
* longitude (WGS84)

The data source can be downloaded as CSV here: [PLZO_CSV_WGS84.zip][5]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swiss-village-directory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swiss-village-directory

## Usage

Require the library

```ruby
require 'swiss_village_directory'
```

Find by attributes:

```ruby
SwissVillageDirectory.repository.find_all_by(name: 'Riedt b. Erlen')
```

or implement your own search logic

```ruby
SwissVillageDirectory.villages.find { |v| v.name == 'Riedt b. Erlen' }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

If you would like to contribute, you're very welcome to.

Please follow these instructions:

* [Contributing][1]
* [Code of Conduct][2]

## License

Copyright (c) 2016 [Renuo AG]

[MIT License][3]

[1]: CONTRIBUTING.md
[2]: CODE_OF_CONDUCT.md
[3]: LICENSE

[4]: https://data.geo.admin.ch/ch.swisstopo-vd.ortschaftenverzeichnis_plz/
[5]: https://data.geo.admin.ch/ch.swisstopo-vd.ortschaftenverzeichnis_plz/ortschaftenverzeichnis_plz/ortschaftenverzeichnis_plz_4326.csv.zip

[Renuo AG]: https://www.renuo.ch

