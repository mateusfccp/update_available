import 'package:http/http.dart';
import 'package:version/version.dart';

import '../domain/get_ios_package_version.dart';
import 'json.dart';

const _lookupURL = 'https://itunes.apple.com/lookup';

final GetIOSPackageVersion httpGetIOSPackageVersion = (String bundleId) async {
  final response = await get('$_lookupURL?bundleId=$bundleId');
  final versionString = getStringByKey(response.body)('version');
  return Version.parse(versionString);
};
