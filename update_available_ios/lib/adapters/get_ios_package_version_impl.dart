import 'package:http/http.dart';
import 'package:pub_semver/pub_semver.dart';

import '../domain/get_ios_package_version.dart';
import 'json.dart';

const _itunesURL = 'https://itunes.apple.com';

final GetIOSPackageVersion httpGetIOSPackageVersion =
    (String appStoreRegion, String bundleId) async {
  final uri =
      Uri.parse('$_itunesURL/$appStoreRegion/lookup?bundleId=$bundleId');
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
