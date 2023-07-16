/// Search for countries by cca2, ccn3, cca3 or cioc country codes
///
/// Case insensitive, returns exact matches.
/// To be used as part of a cascade search sequence.
List<Map<String, dynamic>> searchByCode({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  final queryUpper = query.toUpperCase();
  return data
      .where((e) =>
          e['cca2'].toString().toUpperCase() == queryUpper ||
          e['ccn3'].toString().toUpperCase() == queryUpper ||
          e['cca3'].toString().toUpperCase() == queryUpper ||
          e['cioc'].toString().toUpperCase() == queryUpper)
      .toList();
}

/// Search for countries by cca2, ccn3, cca3 or cioc country codes
///
/// Expects a list of country codes.
///
/// Case insensitive, returns exact matches.
List<Map<String, dynamic>> searchByCodes({
  required List<Map<String, dynamic>> data,
  required List<String> queryList,
}) {
  final queryListUpper = queryList.map((e) => e.toUpperCase()).toList();
  List<Map<String, dynamic>> result = [];
  for (final query in queryListUpper) {
    List<Map<String, dynamic>> hit = searchByCode(
      data: data,
      query: query,
    );
    result.addAll(hit);
  }
  return result;
}
