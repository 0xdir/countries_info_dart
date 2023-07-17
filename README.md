[![pub package](https://img.shields.io/pub/v/countries_info.svg)](https://pub.dev/packages/countries_info)
[![package publisher](https://img.shields.io/pub/publisher/countries_info.svg)](https://pub.dev/packages/countries_info/publisher)

An opinionated library to query information on countries. Apply complex search logic
quickly and easily using cascade search filters.

## Using

The easiest way to use this library is via the top-level ```Countries``` class.

```dart
import 'package:countries_info/countries_info.dart';

void main() {
  /// Initialize the main object
  Countries countries = Countries();

  /// Get all countries
  print(countries
      .all()
      .length);

  /// Get common names of all countries
  /// sorted alphabetically ascending
  print(countries.getCommonNames(sort: 'asc'));

  /// Get official names of all countries
  /// sorted alphabetically descending
  print(countries.getOfficialNames(sort: 'desc'));
}
```

There are two ways to filter for specific countries of interest:

1. basic search - great for one-off, simple search conditions
2. cascade search - great for complex, multiple search conditions

Basic search example:

```dart
import 'package:countries_info/countries_info.dart';

void main() {
  /// Initialize the main object
  Countries countries = Countries();

  /// Search countries by common or official names
  ///
  /// Case insensitive, returns partial matches.
  countries.name(query: 'indo').forEach((country) {
    print(country['name']['official']);
  });
}
```

Cascade search example:

```dart
import 'package:countries_info/countries_info.dart';

void main() {
  /// Initialize the main object
  Countries countries = Countries();

  /// Initialize a cascade search
  /// 
  /// Add multiple cascade search filters as required. Each cascade filters the previous results.
  countries
    ..filter()
    ..byCodes(queryList: ['IND', 'IDN', 'USA', 'AUS'])
    ..byLanguage(query: 'english')

  /// Apply the filters and do stuff with the results
    ..apply().forEach((country) {
      print(country['name']['official']);
    });
}
```

## Supported get and search queries

Get:
1. common names
2. official names

Search by:
1. country name (common and official)
2. country code (cca2, ccn3, cca3 and cioc)
3. currency (currency code and name)
4. demonym (how a citizen is called)
5. language (language code and name)
6. capital city
7. calling code
8. region and sub region

Not implemented:

1. everything else

If more queries are needed, feel free to open a discussion on github.

## Getting Help

Submit an issue on [github].

[github]: https://github.com/0xdir/countries_info_dart


## This work builds upon:
1. [REST Countries](https://restcountries.com/)
2. [Sealed Countries](https://pub.dev/packages/sealed_countries)
Do check out their projects too!

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github]
2. Discuss proposed changes
3. Submit a PR (optional)

[github]: https://github.com/0xdir/countries_info_dart

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, reach out to me on [github].

[github]: https://github.com/sponsors/0xdir

Or buy me coffee at `0xdir.near`.