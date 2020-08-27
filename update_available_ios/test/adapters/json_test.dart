import 'package:flutter_test/flutter_test.dart';
import 'package:update_available_ios/adapters/json.dart';

const json = '{"artistId": 456036234,'
    '"artistName": "CONFEDERACAO DAS UNIOES BRASILEIRAS DA IGREJA ADVENTISTA DO SETIMO DIA",'
    '"price": 0.00,'
    '"bundleId": "org.adventistas.armsa",'
    '"version": "1.3.0",'
    '"wrapperType": "software",'
    '"userRatingCount": 0}';

void main() {
  final extract = getStringByKey(json);

  test(
    'should return the value when given a valid key and value is string',
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
    'should return the null when given an invalid key or value is not',
    () {
      expect(extract('artistId'), null);
      expect(extract('price'), null);
      expect(extract('userRatingCount'), null);
      expect(extract('unexistentKey'), null);
    },
  );
}
