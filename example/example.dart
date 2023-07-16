import 'package:countries_info/countries_info.dart';

/// This example illustrates how to perform a cascade search
///
/// The cascade search a powerful way to apply multiple search filters
/// quickly and easily.
///
/// If you only need to apply a single search filter, look at the
/// examples in basic_search_example.dart instead.
void main() {
  /// Initialize the main object
  Countries countries = Countries();

  /// Initialize a cascade search
  countries
    ..filter()

    /// Add multiple cascade search filters as required
    ///
    /// Each cascade filters the previous results
    ..byCodes(queryList: ['IND', 'IDN', 'USA', 'AUS'])
    ..byLanguage(query: 'english')

    /// Apply the filters
    ..apply();

  /// Access the cascade search results via [cascadeResult]
  print(countries.cascadeResult.length);

  /// To start a new cascade search, simply start again
  ///
  /// Initialize a cascade search
  countries
    ..filter()

    /// Add multiple cascade search filters as required
    ///
    /// Each cascade filters the previous results
    ..byRegion(query: 'asia')
    ..byCodes(queryList: ['IND', 'IDN', 'LAO'])

    /// Apply the filters
    ///
    /// This time we use the results directly
    ..apply().forEach((country) {
      /// Do stuff with the results
      print(country['name']['official']);
    });
}
