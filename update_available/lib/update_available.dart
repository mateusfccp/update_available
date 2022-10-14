import 'package:update_available_platform_interface/update_available_platform_interface.dart';

export 'package:update_available_platform_interface/update_available_platform_interface.dart';

/// Checks if there is an update available for the application.
///
/// If the `iosAppStoreRegion` is set, the iOS version is checked in the specified region.
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
Future<Availability> getUpdateAvailability({String? iosAppStoreRegion}) {
  return UpdateAvailablePlatform.instance.getUpdateAvailability(
    iosAppStoreRegion: iosAppStoreRegion,
  );
}
