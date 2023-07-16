import 'package:countries_info/countries_info.dart';
import 'package:test/test.dart';

void main() {
  test('Should get all countries', () {
    Countries countries = Countries();
    expect(
      countries.all().length,
      250,
    );
  });

  test('Should sort ascending', () {
    Countries countries = Countries();
    expect(
      countries.getCommonNames(sort: 'asc')[0][0],
      'A',
    );
  });

  test('Should sort descending', () {
    Countries countries = Countries();
    expect(
      countries.getCommonNames(sort: 'desc').last[0],
      'A',
    );
  });

  test('Should get by country code', () {
    Countries countries = Countries();
    expect(
      countries.code(query: 'JOR').first['name']['common'],
      'Jordan',
    );
  });

  test('Should get by country codes', () {
    Countries countries = Countries();
    expect(
      countries.codes(queryList: ['USA', 'IND']).last['name']['common'],
      'India',
    );
  });

  test('Should get by country codes', () {
    Countries countries = Countries();
    expect(
      countries.codes(queryList: ['USA', 'IND']).last['name']['common'],
      'India',
    );
  });

  test('Should get by currency code', () {
    Countries countries = Countries();
    expect(
      countries.currency(query: 'AUS')[1]['name']['common'],
      'Australia',
    );
  });

  test('Should get by partial currency name', () {
    Countries countries = Countries();
    expect(
      countries.currency(query: 'tralian')[1]['name']['common'],
      'Australia',
    );
  });

  test('Should get by demonym', () {
    Countries countries = Countries();
    expect(
      countries.demonym(query: 'tralian').first['name']['common'],
      'Australia',
    );
  });

  test('Should get by language code', () {
    Countries countries = Countries();
    expect(
      countries.language(query: 'ara').length,
      31,
    );
  });

  test('Should get by capital city', () {
    Countries countries = Countries();
    expect(
      countries.capital(query: 'tallinn').length,
      1,
    );
  });

  test('Should get by calling code with +', () {
    Countries countries = Countries();
    expect(
      countries.callingCode(query: '+61').length,
      3,
    );
  });

  test('Should get by calling code without +', () {
    Countries countries = Countries();
    expect(
      countries.callingCode(query: '61').length,
      3,
    );
  });

  test('Should get by region', () {
    Countries countries = Countries();
    expect(
      countries.region(query: 'asia').length,
      50,
    );
  });

  test('Should get by sub region', () {
    Countries countries = Countries();
    expect(
      countries.subRegion(query: 'central asia').length,
      5,
    );
  });
}
