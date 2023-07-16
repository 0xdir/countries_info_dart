/// Search by language code or language name
///
/// Case insensitive, returns exact matches for language codes,
/// partial matches for language names.
List<Map<String, dynamic>> searchByLanguage({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();
  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['languages'] != null) {
      country['languages'].forEach((k, v) => {
            if (k.toString().toUpperCase() == queryUpper ||
                v.toString().toUpperCase().contains(queryUpper))
              {result.add(country)}
          });
    }
  }
  return result;
}
