import 'package:package_info/package_info.dart';
import 'package:update_available_ios/domain/get_ios_bundle_id.dart';

final GetIOSBundleId pluginGetIOSBundleId = () async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
};
