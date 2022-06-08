import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'availability.dart';

/// The platform interface for update_available.
abstract class UpdateAvailablePlatform extends PlatformInterface {
  UpdateAvailablePlatform() : super(token: _token);

  static final Object _token = Object();

  static UpdateAvailablePlatform _instance = UnimplementedUpdateAvailable();

  /// The default instance of [UpdateAvailablePlatform] to use.
  ///
  /// Platform-specific plugins should override this with their own class
  /// that extends [UpdateAvailablePlatform] when they register themselves.
  ///
  /// Defaults to [MethodChannelLocation].
  static UpdateAvailablePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UpdateAvailablePlatform] when they register themselves.
  static set instance(UpdateAvailablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Availability> getUpdateAvailability({String? iosAppStoreRegion}) {
    const message = 'getUpdateAvailability() has not been implemented.';
    throw UnimplementedError(message);
  }
}

/// The unimplemented platform for [UpdateAvailablePlatform].
class UnimplementedUpdateAvailable extends UpdateAvailablePlatform {}
