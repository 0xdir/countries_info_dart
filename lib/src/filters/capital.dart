/// Search by capital city
///
/// Case insensitive, returns partial matches.
List<Map<String, dynamic>> searchByCapital({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();
  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['capital'] != null) {
      country['capital'].forEach((e) => {
            if (e.toString().toUpperCase().contains(queryUpper))
              {result.add(country)}
          });
    }
  }
  return result;
}
