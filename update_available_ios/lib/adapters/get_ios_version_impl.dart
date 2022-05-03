import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

import '../domain/get_ios_version.dart';

GetIOSVersion pluginGetIOSVersion() {
  return () async {
    final packageInfo = await PackageInfo.fromPlatform();

    try {
      return Version.parse(packageInfo.version);
    } on FormatException {
      return null;
    }
  };
}
