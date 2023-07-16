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

  /// Filter countries by common or official names
  ///
  /// Case insensitive, returns partial matches.
  countries

    /// Initialize the filter
    ..filter()

    /// Filter all countries by partial name
    ///
    /// Hits: Countries with letter 'i'
    ..byName(query: 'i')

    /// Filter all countries by region
    ..byRegion(query: 'asia')

    /// Filter all countries by sub region
    ..bySubRegion(query: 'southern')

    /// Filter results by a single country code
    // ..byCode(query: 'IDN')

    /// Filter results by multiple country codes
    // ..byCodes(queryList: ['IND', 'IDN', 'USA'])

    /// Filter results by currency
    ///
    /// Hits: Countries using USD
    // ..byCurrency(query: 'USD')

    /// Filter results by demonym
    ///
    /// Hits: Countries with demonym containing 'ian'
    /// ie. India, Indonesia
    ..byDemonym(query: 'ian')

    /// Filter results by language name
    ///
    /// Hits: India, Indonesia
    ..byLanguage(query: 'english')

    /// Filter results by capital city
    // ..byCapital(query: 'jakarta')

    /// Filter results by calling code
    // ..byCallingCode(query: '+61')

    /// Get the result of the cascade
    ..apply().forEach((country) {
      /// Do stuff with the results
      print(country['name']['official']);
    });
}
