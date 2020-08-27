import 'package:package_info/package_info.dart';
import 'package:version/version.dart';

import '../domain/get_ios_version.dart';

final GetIOSVersion pluginGetIOSVersion = () async {
  final packageInfo = await PackageInfo.fromPlatform();
  final version = Version.parse(packageInfo.version);

  return version;
};
