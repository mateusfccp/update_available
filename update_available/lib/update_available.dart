import 'dart:io';

import 'package:update_available_android/update_available_android.dart'
    as android;
import 'package:update_available_ios/update_available_ios.dart' as ios;
import 'package:update_available_platform_interface/update_available_platform_interface.dart';

export 'package:update_available_platform_interface/update_available_platform_interface.dart';

// TODO: Use federated model when #54588 is solved
// Future<Availability> getUpdateAvailability() =>
//     UpdateAvailablePlatform.instance.getUpdateAvailability();

/// Checks if there is an update available for the application.
///
/// This method returns the [Availability] of the update.
///
/// Example:
/// ```dart
/// void main() async {
///   final updateAvailability = await getUpdateAvailability();
///
///   final text = updateAvailability.fold(
///     available: () => "There's an update to you app! Please, update it "
///                      "so you have access to the latest features!",
///     notAvailable: () => 'No update is available for your app.',
///     unknown: () => "It was not possible to determine if there is or not "
///                    "an update for your app.",
///   );
///
///   print(text);
/// }
/// ```
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
