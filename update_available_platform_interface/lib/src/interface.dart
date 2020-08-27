import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'availability.dart';

abstract class UpdateAvailablePlatform extends PlatformInterface {
  UpdateAvailablePlatform() : super(token: _token);

  static final Object _token = Object();

  static UpdateAvailablePlatform _instance = UnimplementedUpdateAvailable();

  static UpdateAvailablePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(UpdateAvailablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Availability> getUpdateAvailability() => throw UnimplementedError(
        'getUpdateAvailability() has not been implemented.',
      );
}

class UnimplementedUpdateAvailable extends UpdateAvailablePlatform {}
