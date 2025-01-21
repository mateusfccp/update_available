import 'package:test/test.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:update_available_ios/adapters/get_ios_package_version_impl.dart';

void main() {
  final getVersion = httpGetIOSPackageVersion();

  group('httpGetIOSPackageVersion', () {
    test('should return null if the given bundle ID does not exist', () async {
      final version = await getVersion('lorem.ipsum.dolor');
      expect(version, isNull);
    });

    test('should get the latest version of getVersion given bundle ID',
        () async {
      final version = await getVersion('org.adventistas.armsa');
      expect(version, isNotNull);
      version as Version;
      expect(
        version.compareTo(
          VersionRange(min: Version(1, 3, 0)),
        ),
        1,
      );
    });
  });
}
