import 'dart:async';

import 'package:flutter/services.dart';
import 'package:update_available_platform_interface/update_available_platform_interface.dart';

class UpdateAvailablePlugin extends UpdateAvailablePlatform {
  static const platform = MethodChannel('me.mateusfccp/update_available');

  @override
  Future<Availability> getUpdateAvailability() async {
    try {
      final available = await platform.invokeMethod('getUpdateAvailability');
      return available ? UpdateAvailable : NoUpdateAvailable;
    } on PlatformException {
      return UnknownAvailability;
    }
  }
}
