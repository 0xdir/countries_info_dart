class Name {
  String? common;
  String? official;
  Map<String, dynamic>? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      common: map['common'],
      official: map['official'],
      nativeName: map['nativeName'],
    );
  }

  @override
  String toString() {
    return 'Name{common: $common, official: $official, nativeName: $nativeName}';
  }
}
