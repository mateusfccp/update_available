import 'package:http/http.dart';
import 'package:pub_semver/pub_semver.dart';

import '../domain/get_ios_package_version.dart';
import 'json.dart';

const _lookupURL = 'https://itunes.apple.com/lookup';

final GetIOSPackageVersion httpGetIOSPackageVersion = (String bundleId) async {
  final uri = Uri.parse('$_lookupURL?bundleId=$bundleId');
  final response = await get(uri);
  final versionString = getStringByKey(response.body)('version');

  if (versionString == null) {
    return null;
  }

  try {
    return Version.parse(versionString);
  } on FormatException {
    return null;
  }
};
