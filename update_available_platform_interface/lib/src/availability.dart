import 'package:meta/meta.dart';

/// The availability of the update.
///
/// An udpdate may be available or not, which will be represented with
/// [UpdateAvailable] and [NoUpdateAvailable], respectively. Finally, if
/// the process couldn't determine if a update is available or not, an
/// [UnknownAvailability] will be yielded.
///
/// To check against the status, the recommended way is to use [fold] or
/// [foldElse], as they are safest than comparing with `if`, because it forces
/// you to provide every possible case.

@immutable
class Availability {
  final _Availability _availability;

  const Availability._(this._availability);

  /// Returns a value based on the [Availability].
  ///
  /// All parameters are required and must be not `null`.
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
  ///
  /// If you don't want to exhaustively check for each case, refer to [foldElse].
  T fold<T>({
    required T Function() available,
    required T Function() notAvailable,
    required T Function() unknown,
  }) {
    if (_availability == _Availability.UpdateAvailable) {
      return available();
    } else if (_availability == _Availability.NoUpdateAvailable) {
      return notAvailable();
    } else {
      return unknown();
    }
  }

  /// Returns a value based on the [Availability], non-exhaustivelty.
  ///
  /// Instead of passing all the cases exhaustively, only [orElse] is mandatory,
  /// while all others are optional.
  ///
  /// Example:
  /// ```dart
  /// void main() async {
  ///   final updateAvailability = await getUpdateAvailability();
  ///
  ///   final text = updateAvailability.foldElse(
  ///     available: () => "There's an update to you app! Please, update it "
  ///                      "so you have access to the latest features!",
  ///     orElse: () => 'No update is available for your app.',
  ///   );
  ///
  ///   print(text);
  /// }
  /// ```
  T foldElse<T>({
    T Function()? available,
    T Function()? notAvailable,
    T Function()? unknown,
    required T Function() orElse,
  }) {
    if (available != null && _availability == _Availability.UpdateAvailable) {
      return available();
    } else if (notAvailable != null &&
        _availability == _Availability.NoUpdateAvailable) {
      return notAvailable();
    } else if (unknown != null &&
        _availability == _Availability.UnknownAvailability) {
      return unknown();
    } else {
      return orElse();
    }
  }

  @override
  String toString() => fold(
        available: () => 'Update available',
        notAvailable: () => 'No update available',
        unknown: () => 'Unknown availability',
      );
}

enum _Availability {
  UpdateAvailable,
  NoUpdateAvailable,
  UnknownAvailability,
}

/// Represents that an update is available.
const UpdateAvailable = Availability._(_Availability.UpdateAvailable);

/// Represents that no update is available.
const NoUpdateAvailable = Availability._(_Availability.NoUpdateAvailable);

/// Represents that it was not possible to determine if an update is available
/// or not.
const UnknownAvailability = Availability._(_Availability.UnknownAvailability);
