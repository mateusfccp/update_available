import 'package:test/test.dart';
import 'package:update_available_ios/adapters/json.dart';

const json = '''
{
  "artistId": 456036234,
  "artistName": "CONFEDERACAO DAS UNIOES BRASILEIRAS DA IGREJA ADVENTISTA DO SETIMO DIA",'
  "price": 0.00,'
  "bundleId": "org.adventistas.armsa",'
  "version": "1.3.0",'
  "wrapperType": "software",'
  "userRatingCount": 0
}'
''';

void main() {
  final extract = getStringByKey(json);

  group('getStringByKey', () {
    test(
      'should return the value of a key when the key exists in the object and it is a string',
      () {
        expect(
          extract('artistName'),
          'CONFEDERACAO DAS UNIOES BRASILEIRAS DA IGREJA ADVENTISTA DO SETIMO DIA',
        );
        expect(extract('bundleId'), 'org.adventistas.armsa');
        expect(extract('version'), '1.3.0');
        expect(extract('wrapperType'), 'software');
      },
    );

    test(
      'should return null when a key that does not exist in the object is given',
      () {
        expect(extract('nonexistentKey'), isNull);
      },
    );

    test(
      'should return null when the key given, although exists in the object, has a non-string value',
      () {
        expect(extract('artistId'), isNull);
        expect(extract('price'), isNull);
        expect(extract('userRatingCount'), isNull);
      },
    );
  });
}
