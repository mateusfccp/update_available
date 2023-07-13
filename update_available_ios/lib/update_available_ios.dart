import 'package:update_available_platform_interface/update_available_platform_interface.dart';

import 'adapters/get_ios_bundle_id_impl.dart';
import 'adapters/get_ios_package_version_impl.dart';
import 'adapters/get_ios_version_impl.dart';
import 'domain/get_ios_bundle_id.dart';
import 'domain/get_ios_package_version.dart';
import 'domain/get_ios_version.dart';

export 'adapters/get_ios_bundle_id_impl.dart';
export 'adapters/get_ios_package_version_impl.dart';
export 'adapters/get_ios_version_impl.dart';

final class UpdateAvailableIosPlugin extends UpdateAvailablePlatform {
  final GetIOSBundleId getIOSBundleId;
  final GetIOSVersion getIOSVersion;
  final GetIOSPackageVersion getIOSPackageVersion;

  UpdateAvailableIosPlugin({
    required this.getIOSBundleId,
    required this.getIOSVersion,
    required this.getIOSPackageVersion,
  });

  static void registerWith() {
    UpdateAvailablePlatform.instance = UpdateAvailableIosPlugin(
      getIOSBundleId: pluginGetIOSBundleId(),
      getIOSPackageVersion: httpGetIOSPackageVersion(),
      getIOSVersion: pluginGetIOSVersion(),
    );
  }

  @override
  Future<Availability> getUpdateAvailability({String? iosAppStoreRegion}) async {
    try {
      final bundleId = await getIOSBundleId();
      final packageVersion = await getIOSPackageVersion(bundleId, iosAppStoreRegion: iosAppStoreRegion);
      final version = await getIOSVersion();

      if (version == null || packageVersion == null) {
        return const UnknownAvailability();
      } else {
        return packageVersion > version ? const UpdateAvailable() : const NoUpdateAvailable();
      }
    } catch (error) {
      return const UnknownAvailability();
    }
  }
}
