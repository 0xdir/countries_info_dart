import 'package:countries_info/countries_info.dart';

/// This example illustrates basic search.
///
/// If you have have multiple search conditions, consider using
/// cascade search. see cascade_search_example.dart
void main() {
  /// Initialize the main object
  Countries countries = Countries();

  /// Get all countries
  print(countries.all().length);

  /// Get common names of all countries
  /// sorted alphabetically ascending
  print(countries.getCommonNames(sort: 'asc'));

  /// Get official names of all countries
  /// sorted alphabetically descending
  print(countries.getOfficialNames(sort: 'desc'));

  /// Search countries by common or official names
  ///
  /// Case insensitive, returns partial matches.
  countries.name(query: 'indo').forEach((country) {
    print(country['name']['official']);
  });

  /// Search countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// Case insensitive, returns exact matches.
  print(countries.code(query: 'JOR'));

  /// Search countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// Case insensitive, returns exact matches.
  print(countries.codes(queryList: ['USA', 'IND']).length);

  /// Search countries by currency code or name
  ///
  /// Case insensitive, returns exact matches for currency code and
  /// partial matches for currency names.
  print(countries.currency(query: 'AUS').length);
  print(countries.currency(query: 'tralian').length);

  /// Search by how a citizen is called ie. demonym
  ///
  /// Case insensitive, returns partial matches.
  ///
  /// This is a multi-language search which searches masculine and
  /// feminine terms.
  print(countries.demonym(query: 'tralian').length);

  /// Search by language code or name
  ///
  /// Case insensitive, returns exact matches for language codes,
  /// partial matches for language names.
  print(countries.language(query: 'ara').length);

  /// Search by capital city
  ///
  /// Case insensitive, returns partial matches.
  countries.capital(query: 'tallinn').forEach((country) {
    print(country['name']['common']);
  });

  /// Search by calling code
  ///
  /// eg. +61 = Australia, Christmas Islands, Cocos (Keeling) Islands
  /// eg. +503 = El Savador
  ///
  /// '+' is optional. ie, 503 also returns El Savador.
  ///
  /// Returns exact matches
  countries.callingCode(query: '+61').forEach((country) {
    print(country['name']['common']);
  });

  /// Search by region
  ///
  /// Case insensitive, returns partial matches.
  countries.region(query: 'asia').forEach((country) {
    print(country['name']['common']);
  });

  /// Search by sub region
  ///
  /// Case insensitive, returns partial matches.
  countries.subRegion(query: 'southern asia').forEach((country) {
    print(country['name']['common']);
  });
}
