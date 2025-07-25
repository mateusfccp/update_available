import 'dart:convert';
import 'dart:io';

import 'package:pub_semver/pub_semver.dart';

import '../domain/get_ios_package_version.dart';
import 'json.dart';

const _itunesURL = 'https://itunes.apple.com';

GetIOSPackageVersion httpGetIOSPackageVersion() {
  return (String bundleId, {String? iosAppStoreRegion}) async {
    final Uri uri;

    // Busting iTunes CDN cache
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    if (iosAppStoreRegion == null) {
      uri = Uri.parse('$_itunesURL/lookup?bundleId=$bundleId&_=$timestamp');
    } else {
      uri = Uri.parse(
        '$_itunesURL/$iosAppStoreRegion/lookup?bundleId=$bundleId&_=$timestamp',
      );
    }

    final client = HttpClient();
    final request = await client.getUrl(uri);
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    final versionString = getStringByKey(responseBody)('version');

    if (versionString == null) {
      return null;
    }

    try {
      return Version.parse(versionString);
    } on FormatException {
      return null;
    }
  };
}
