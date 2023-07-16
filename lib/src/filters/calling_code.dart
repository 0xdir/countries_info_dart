/// Search by calling code
///
/// eg. +61 = Australia, Christmas Islands, Cocos (Keeling) Islands
/// eg. +503 = El Savador
///
/// '+' is optional. ie, 503 also returns El Savador.
///
/// Returns exact matches
List<Map<String, dynamic>> searchByCallingCode({
  required List<Map<String, dynamic>> data,
  required String query,
}) {
  if (query[0] != '+') {
    query = '+$query';
  }

  final root = query.substring(0, 2);
  final suffix = query.substring(2);

  List<Map<String, dynamic>> result = [];

  for (final Map<String, dynamic> country in data) {
    if (country['idd'] != null && country['idd']['root'] != null) {
      if (country['idd']['root'] == root &&
          country['idd']['suffixes'].contains(suffix)) {
        result.add(country);
      }
    }
  }
  return result;
}
