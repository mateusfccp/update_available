## 3.3.0

- Upgrade Kotlin/Gradle versions
- Upgrade dependencies

## 3.2.0+1

- Update lint dependencies
- Reformat code

## 3.2.0

- Allow bigger Kotlin/Gradle versions
- Upgrade dependencies

## 3.1.0

- Add support for Android namespace
- Bump `compileSdkVersion` to 34
- Update `com.google.android.play:app-update` to `2.1.0`

## 3.0.1

- Upgraded `flutter_lints` to `^3.0.1`

## 3.0.0

- Requires Dart 3.0 or later
- `UpdateAvailableAndroidPlugin` can't be implemented, extended or mixed anymore

## 2.3.0

- Minimum Dart SDK versions is now 2.16
- Updated some dependencies versions

## 2.2.1

- Fixed critical issue that made the plugin break on Android (#21). Thanks to @kuhnroyal for solving the issue!

## 2.2.0

**Warning:** This version has a critical issue and won't work on Android (#21). Please, use 2.2.1 instead.

- Update dependencies
- Update to plugin v2
- Fix error that happened when using the package with other packages that used the Google API (#18)
  - Thanks to @otopba for identifying the issue and providing the PR!

## 2.0.0

- *Null-safety* bump to stable
- Dependencies versions bump

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. **@ashishbeck** [thinks it's OK to be published as *stable*](https://github.com/mateusfccp/update_available/issues/5#issuecomment-797945264), so I am doing it. If you find any issue, please report.

## 2.0.0-nullsafety

- Migration to *null-safety*
- Changed `version` to `pub_semver`

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. I am going to ask to someone to test it for me and, as soon it's safe to be used in production, I publish it as stable.

## 1.0.1+1

- Update README.md

## 1.0.1

- Remove pubspec.lock

## 1.0.0

- Initial version
