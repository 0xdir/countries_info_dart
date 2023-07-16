/// The country object
class Country {
  Map<String, dynamic>? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Map<String, dynamic>? currencies;
  Map<String, dynamic>? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Map<String, dynamic>? languages;
  Map<String, dynamic>? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Map<String, dynamic>? demonyms;
  String? flag;
  Map<String, dynamic>? maps;
  int? population;
  Map<String, dynamic>? gini;
  String? fifa;
  Map<String, dynamic>? car;
  List<String>? timezones;
  List<String>? continents;
  Map<String, dynamic>? flags;
  Map<String, dynamic>? coatOfArms;
  String? startOfWeek;
  Map<String, dynamic>? capitalInfo;
  Map<String, dynamic>? postalCode;

  Country.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    tld = map['tld'];
    cca2 = map['cca2'];
    ccn3 = map['ccn3'];
    cca3 = map['cca3'];
    cioc = map['cioc'];
    independent = map['independent'];
    status = map['status'];
    unMember = map['unMember'];
    currencies = map['currencies'];
    idd = Map<String, dynamic>.from(map['idd'] ?? {});
    capital = map['capital'];
    altSpellings = map['altSpellings'];
    region = map['region'];
    subregion = map['subregion'];
    languages = map['languages'];
    translations = map['translations'];
    latlng = List<double>.from(map['latlng']);
    landlocked = map['landlocked'];
    borders = map['borders'];
    area = map['area'];
    demonyms = map['demonyms'];
    flag = map['flag'];
    maps = map['maps'];
    population = map['population'];
    gini = map['gini'];
    fifa = map['fifa'];
    car = map['car'];
    timezones = map['timezones'];
    continents = map['continents'];
    flags = map['flags'];
    coatOfArms = Map<String, dynamic>.from(map['coatOfArms'] ?? {});
    startOfWeek = map['startOfWeek'];
    capitalInfo = Map<String, dynamic>.from(map['capitalInfo'] ?? {});
    postalCode = map['postalCode'];
  }

  @override
  String toString() {
    return '''
    Country:
      Name: $name
      TLD: $tld
      cca2: $cca2
      ccn3: $ccn3
      cca3: $cca3
      cioc: $cioc
      Independent: $independent
      Status: $status
      UN Member: $unMember
      Currencies: $currencies
      IDD: $idd
      Capital: $capital
      Alt Spellings: $altSpellings
      Region: $region
      Subregion: $subregion
      Languages: $languages
      Translations: $translations
      LatLng: $latlng
      Landlocked: $landlocked
      Borders: $borders
      Area: $area
      Demonyms: $demonyms
      Flag: $flag
      Maps: $maps
      Population: $population
      Gini: $gini
      FIFA: $fifa
      Car: $car
      Timezones: $timezones
      Continents: $continents
      Flags: $flags
      Coat of Arms: $coatOfArms
      Start of Week: $startOfWeek
      Capital Info: $capitalInfo
      Postal Code: $postalCode
    ''';
  }
}
