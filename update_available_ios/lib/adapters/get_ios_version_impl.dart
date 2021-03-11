import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

import '../domain/get_ios_version.dart';

final GetIOSVersion pluginGetIOSVersion = () async {
  final packageInfo = await PackageInfo.fromPlatform();

  try {
    return Version.parse(packageInfo.version);
  } on FormatException {
    return null;
  }
};
