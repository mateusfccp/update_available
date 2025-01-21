import 'package:flutter_test/flutter_test.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:update_available_ios/update_available_ios.dart';
import 'package:update_available_platform_interface/update_available_platform_interface.dart';

void main() {
  group('getUpdateAvailability', () {
    test(
      "should return UnknownAvailability when can't determine the package version",
      () async {
        // Arrange
        final plugin = UpdateAvailableIosPlugin(
          getIOSBundleId: () async => 'fakeId',
          getIOSPackageVersion: (_, {iosAppStoreRegion}) async => null,
          getIOSVersion: () async => Version(1, 0, 0),
        );

        // Assert
        expect(
            await plugin.getUpdateAvailability(), const UnknownAvailability());
      },
    );

    test(
      "should return UnknownAvailability when can't determine the current version",
      () async {
        // Arrange
        final plugin = UpdateAvailableIosPlugin(
          getIOSBundleId: () async => 'fakeId',
          getIOSPackageVersion: (_, {iosAppStoreRegion}) async =>
              Version(1, 0, 0),
          getIOSVersion: () async => null,
        );

        // Assert
        expect(
            await plugin.getUpdateAvailability(), const UnknownAvailability());
      },
    );

    test(
      'should return UpdateAvailable when current version is lower than published',
      () async {
        // Arrange
        final plugin = UpdateAvailableIosPlugin(
          getIOSBundleId: () async => 'fakeId',
          getIOSPackageVersion: (_, {iosAppStoreRegion}) async =>
              Version(1, 1, 0),
          getIOSVersion: () async => Version(1, 0, 0),
        );

        // Assert
        expect(await plugin.getUpdateAvailability(), const UpdateAvailable());
      },
    );

    test(
      'should return NoUpdateAvailable when current version is equal to published',
      () async {
        // Arrange
        final plugin = UpdateAvailableIosPlugin(
          getIOSBundleId: () async => 'fakeId',
          getIOSPackageVersion: (_, {iosAppStoreRegion}) async =>
              Version(1, 0, 0),
          getIOSVersion: () async => Version(1, 0, 0),
        );

        // Assert
        expect(await plugin.getUpdateAvailability(), const NoUpdateAvailable());
      },
    );

    test(
      'should return NoUpdateAvailable when current version is bigger than published',
      () async {
        // Arrange
        final plugin = UpdateAvailableIosPlugin(
          getIOSBundleId: () async => 'fakeId',
          getIOSPackageVersion: (_, {iosAppStoreRegion}) async =>
              Version(1, 0, 0),
          getIOSVersion: () async => Version(1, 1, 0),
        );

        // Assert
        expect(await plugin.getUpdateAvailability(), const NoUpdateAvailable());
      },
    );
  });
}
