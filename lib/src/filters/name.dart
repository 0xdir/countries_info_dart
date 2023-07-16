/// Search for countries by common or official name
///
/// Provide full eg. Indonesia or partial names eg. indo to search
///
/// Case insensitive, returns partial matches.
List<Map<String, dynamic>> searchByName({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  return data
      .where((e) =>
          e['name']['common']
              .toString()
              .toUpperCase()
              .contains(query.toUpperCase()) ||
          e['name']['common'].toString().toUpperCase().contains(query))
      .toList();
}
