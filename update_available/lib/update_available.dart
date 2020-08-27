import 'dart:io';

import 'package:update_available_platform_interface/update_available_platform_interface.dart';

import 'package:update_available_android/update_available_android.dart'
    as android;

import 'package:update_available_ios/update_available_ios.dart' as ios;

export 'package:update_available_platform_interface/availability.dart';

// TODO: Use federated model when #54588 is solved
// Future<Availability> getUpdateAvailability() =>
//     UpdateAvailablePlatform.instance.getUpdateAvailability();

Future<Availability> getUpdateAvailability() {
  if (Platform.isAndroid) {
    return android.UpdateAvailablePlugin().getUpdateAvailability();
  } else if (Platform.isIOS) {
    return ios.UpdateAvailablePlugin(
      getIOSBundleId: ios.pluginGetIOSBundleId,
      getIOSPackageVersion: ios.httpGetIOSPackageVersion,
      getIOSVersion: ios.pluginGetIOSVersion,
    ).getUpdateAvailability();
  } else {
    return UpdateAvailablePlatform.instance.getUpdateAvailability();
  }
}
