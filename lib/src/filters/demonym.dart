/// Search by how a citizen is called ie. demonym
///
/// Case insensitive, returns partial matches.
///
/// This is a multi-language search which searches masculine and
/// feminine terms.
List<Map<String, dynamic>> searchByDemonym({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();
  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['demonyms'] != null) {
      country['demonyms'].forEach((k, v) => {
            if (v['f'].toString().toUpperCase().contains(queryUpper) ||
                v['m'].toString().toUpperCase().contains(queryUpper))
              {result.add(country)}
          });
    }
  }
  return result;
}
