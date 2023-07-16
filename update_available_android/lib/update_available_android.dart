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
        null => const UnknownAvailability(),
      };
    } on PlatformException {
      return const UnknownAvailability();
    }
  }
}
