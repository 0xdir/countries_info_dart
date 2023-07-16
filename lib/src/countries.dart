import 'filters/calling_code.dart';
import 'filters/capital.dart';
import 'filters/currency.dart';
import 'filters/demonym.dart';
import 'filters/language.dart';
import 'filters/region.dart';
import 'filters/code.dart';
import 'filters/name.dart';
import 'list_of_countries.dart';

/// The main object
///
/// Contains implementations for:
///
/// 1. a basic one-off search
///
/// eg.
///
/// ```dart
///   countries.name(query: 'indo').forEach((country) { // One-off search
///     print(country['name']['official']); // Do stuff with the results
///   });
/// ```
///
/// 2. cascade search
///
/// eg.
///
/// ```dart
///
///   Countries countries = Countries();
///
///   countries
///     ..filter() // Initialize the filter
///     ..byName() // Filter by name
///     ..byCode() // Then filter the results by country code
///     ..get().forEach((country) { // Get the results
///       ... // do stuff
///     });
/// ```
///
class Countries {
  /// All data
  late final List<Map<String, dynamic>> _data;

  /// Accumulator for cascade search operations
  List<Map<String, dynamic>> _accumulator = [];

  /// Result for cascade search operations
  List<Map<String, dynamic>> cascadeResult = [];

  /// Initializes the data
  Countries() {
    _data = getAllData();
  }

  /// Returns all data
  ///
  /// Included here as a reference for users who want to see the
  /// underlying data.
  ///
  /// Use basic search or cascade search to filter for desired data.
  List<Map<String, dynamic>> all() {
    return _data;
  }

  /// Returns a list of common names for all countries
  ///
  /// [Sort] the list ascending (asc) or descending (desc).
  List<String> getCommonNames({required String sort}) {
    final List<String> list = [];
    for (final e in _data) {
      list
        ..add(e['name']['common'])
        ..sort();
    }
    switch (sort) {
      case 'asc':
        return list;
      case 'desc':
        return List.from(list.reversed);
      default:
        return list;
    }
  }

  /// Returns a list of official names for all countries
  ///
  /// [Sort] the list ascending (asc) or descending (desc)
  List<String> getOfficialNames({required String sort}) {
    final List<String> list = [];
    for (final e in _data) {
      list
        ..add(e['name']['official'])
        ..sort();
    }
    switch (sort) {
      case 'asc':
        return list;
      case 'desc':
        return List.from(list.reversed);
      default:
        return list;
    }
  }

  /// Search for countries by common or official name
  ///
  /// Provide full eg. Indonesia or partial names eg. indo to search
  ///
  /// Case insensitive, returns partial matches.
  ///
  /// Use this for a standard search (without cascade)
  List<Map<String, dynamic>> name({required String query}) {
    return searchByName(data: _data, query: query);
  }

  /// Filter for countries by common or official name
  ///
  /// To be used as part of a cascade search sequence
  void byName({required String query}) {
    _accumulator = searchByName(data: _accumulator, query: query);
  }

  /// Search for countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// Case insensitive, returns exact matches.
  /// To be used as part of a cascade search sequence.
  List<Map<String, dynamic>> code({required String query}) {
    return searchByCode(data: _data, query: query);
  }

  /// Filter for countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// To be used as part of a cascade search sequence
  void byCode({required String query}) {
    _accumulator = searchByCode(data: _accumulator, query: query);
  }

  /// Search for countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// Expects a list of country codes.
  ///
  /// Case insensitive, returns exact matches.
  List<Map<String, dynamic>> codes({required List<String> queryList}) {
    return searchByCodes(data: _data, queryList: queryList);
  }

  /// Filter for countries by cca2, ccn3, cca3 or cioc country codes
  ///
  /// To be used as part of a cascade search sequence
  void byCodes({required List<String> queryList}) {
    _accumulator = searchByCodes(data: _accumulator, queryList: queryList);
  }

  /// Search for countries by currency code or currency name
  ///
  /// Case insensitive, returns exact matches for currency code and
  /// partial matches for currency names.
  List<Map<String, dynamic>> currency({required String query}) {
    return searchByCurrency(data: _data, query: query);
  }

  /// Filter for countries by currency code or currency name
  ///
  /// To be used as part of a cascade search sequence
  void byCurrency({required String query}) {
    _accumulator = searchByCurrency(data: _accumulator, query: query);
  }

  /// Search by how a citizen is called ie. demonym
  ///
  /// Case insensitive, returns partial matches.
  ///
  /// This is a multi-language search which searches masculine and
  /// feminine terms.
  List<Map<String, dynamic>> demonym({required String query}) {
    return searchByDemonym(data: _data, query: query);
  }

  /// Filter for countries by how a citizen is called ie. demonym
  ///
  /// To be used as part of a cascade search sequence
  void byDemonym({required String query}) {
    _accumulator = searchByDemonym(data: _accumulator, query: query);
  }

  /// Search by language code or language name
  ///
  /// Case insensitive, returns exact matches for language codes,
  /// partial matches for language names.
  List<Map<String, dynamic>> language({required String query}) {
    return searchByLanguage(data: _data, query: query);
  }

  /// Filter for countries by language code or language name
  ///
  /// To be used as part of a cascade search sequence
  void byLanguage({required String query}) {
    _accumulator = searchByLanguage(data: _accumulator, query: query);
  }

  /// Search by capital city
  ///
  /// Case insensitive, returns partial matches.
  List<Map<String, dynamic>> capital({required String query}) {
    return searchByCapital(data: _data, query: query);
  }

  /// Filter for countries by capital city
  ///
  /// To be used as part of a cascade search sequence
  void byCapital({required String query}) {
    _accumulator = searchByCapital(data: _accumulator, query: query);
  }

  /// Search by calling code
  ///
  /// eg. +61 = Australia, Christmas Islands, Cocos (Keeling) Islands
  /// eg. +503 = El Savador
  ///
  /// '+' is optional. ie, 503 also returns El Savador.
  ///
  /// Returns exact matches
  List<Map<String, dynamic>> callingCode({required String query}) {
    return searchByCallingCode(data: _data, query: query);
  }

  /// Filter for countries by calling code
  ///
  /// To be used as part of a cascade search sequence
  void byCallingCode({required String query}) {
    _accumulator = searchByCallingCode(data: _accumulator, query: query);
  }

  /// Search by region
  ///
  /// Case insensitive, returns partial matches.
  List<Map<String, dynamic>> region({required String query}) {
    return searchByRegion(data: _data, query: query);
  }

  /// Filter for region
  ///
  /// To be used as part of a cascade search sequence
  void byRegion({required String query}) {
    _accumulator = searchByRegion(data: _accumulator, query: query);
  }

  /// Search by sub region
  ///
  /// Case insensitive, returns partial matches.
  List<Map<String, dynamic>> subRegion({required String query}) {
    return searchBySubRegion(data: _data, query: query);
  }

  /// Filter for region
  ///
  /// To be used as part of a cascade search sequence
  void bySubRegion({required String query}) {
    _accumulator = searchBySubRegion(data: _accumulator, query: query);
  }

  /// Initialize the accumulator for cascade search
  ///
  /// This is to be used as the first step in a cascade search operation

  void filter() {
    _accumulator = _data;
  }

  /// Returns the results of the cascade search
  List<Map<String, dynamic>> apply() {
    cascadeResult = _accumulator;
    return _accumulator;
  }
}
