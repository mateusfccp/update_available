import 'package:meta/meta.dart';

/// The availability of the update.
///
/// An update may be available or not, which will be represented with
/// [UpdateAvailable] and [NoUpdateAvailable], respectively. If the process
/// couldn't determine if an update is available or not, an
/// [UnknownAvailability] will be returned.
///
/// To check against the status, the recommended way is using `switch`, as
/// the class is sealed and Dart will guarantee exhaustiveness.
@immutable
sealed class Availability {}

/// Represents that an update is available.
final class UpdateAvailable implements Availability {
  const UpdateAvailable();
}

/// Represents that no update is available.
final class NoUpdateAvailable implements Availability {
  const NoUpdateAvailable();
}

/// Represents that it was not possible to determine if an update is available
/// or not.
final class UnknownAvailability implements Availability {
  const UnknownAvailability();
}

