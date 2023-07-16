/// Search for countries by currency code or currency name
///
/// Case insensitive, returns exact matches for currency code and
/// partial matches for currency names.
List<Map<String, dynamic>> searchByCurrency({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();
  List<Map<String, dynamic>> result = [];

  for (final country in data) {
    if (country['currencies'] != null) {
      country['currencies'].forEach((k, v) => {
            if (k == queryUpper ||
                v['name'].toString().toUpperCase().contains(queryUpper))
              {result.add(country)}
          });
    }
  }
  return result;
}
