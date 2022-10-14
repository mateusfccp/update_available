import 'dart:async';

import 'package:flutter/services.dart';
import 'package:update_available_platform_interface/update_available_platform_interface.dart';

class UpdateAvailablePlugin extends UpdateAvailablePlatform {
  static const platform = MethodChannel('me.mateusfccp/update_available');

  static void registerWith() {
    UpdateAvailablePlatform.instance = UpdateAvailablePlugin();
  }

  @override
  Future<Availability> getUpdateAvailability({
    String? iosAppStoreRegion,
  }) async {
    try {
      final available = await platform.invokeMethod('getUpdateAvailability');
      return available ? UpdateAvailable : NoUpdateAvailable;
    } on PlatformException {
      return UnknownAvailability;
    }
  }
}
