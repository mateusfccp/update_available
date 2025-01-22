import 'dart:async';

import 'package:flutter/services.dart';
import 'package:update_available_platform_interface/update_available_platform_interface.dart';

final class UpdateAvailableAndroidPlugin extends UpdateAvailablePlatform {
  static const platform = MethodChannel('me.mateusfccp/update_available');

  static void registerWith() {
    UpdateAvailablePlatform.instance = UpdateAvailableAndroidPlugin();
  }

  @override
  Future<Availability> getUpdateAvailability({String? iosAppStoreRegion}) async {
    try {
      final available = await platform.invokeMethod<bool>('getUpdateAvailability');

      return switch (available) {
        true => const UpdateAvailable(),
        false => const NoUpdateAvailable(),
        null => throw StateError("The implementation should return either 'true' or 'false'. This means that there's an issue with the implementation."),
      };
    } on PlatformException catch (error, stackTrace) {
      return UnknownAvailability(
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
