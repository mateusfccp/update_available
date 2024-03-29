# update_avaiable_platform_interface

A common platform interface for the [update_available](https://pub.dev/packages/update_available) plugin.

This interface allows platform-specific implementations of the [update_available](https://pub.dev/packages/update_available) plugin, as well as the plugin itself, to ensure they are supporting the same interface.

## Usage

To implement a new platform-specific implementation of [update_available](https://pub.dev/packages/update_available), extend `UpdateAvailablePlatform` with an implementation that performs the platform-specific behavior, and when you register your plugin, set the default `UpdateAvailablePlatform` by calling `UpdateAvailablePlatform.instance = MyPlatformUpdateAvailable()`.
