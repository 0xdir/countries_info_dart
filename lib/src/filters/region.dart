/// Search by region
///
/// Case insensitive, returns partial matches.
List<Map<String, dynamic>> searchByRegion({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();

  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['region'] != null) {
      if (country['region'].toString().toUpperCase().contains(queryUpper)) {
        result.add(country);
      }
    }
  }
  return result;
}

/// Search by sub region
///
/// Case insensitive, returns partial matches.
List<Map<String, dynamic>> searchBySubRegion({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();

  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['subregion'] != null) {
      if (country['subregion'].toString().toUpperCase().contains(queryUpper)) {
        result.add(country);
      }
    }
  }
  return result;
}
