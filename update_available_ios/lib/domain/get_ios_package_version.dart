import 'dart:async';

import 'package:pub_semver/pub_semver.dart';

typedef GetIOSPackageVersion = Future<Version?> Function(
  String, {
  String? iosAppStoreRegion,
});
