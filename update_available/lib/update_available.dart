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
///   text = switch (availability) {
///     UpdateAvailable() => "There's an update available!",
///     NoUpdateAvailable() => "There's no update available!",
///     UnknownAvailability() => "Sorry, couldn't determine if there is or not an available update!",
///   };
///
///   print(text);
/// }
/// ```
Future<Availability> getUpdateAvailability({String? iosAppStoreRegion}) {
  return UpdateAvailablePlatform.instance.getUpdateAvailability(iosAppStoreRegion: iosAppStoreRegion);
}
