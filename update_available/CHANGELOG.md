## 3.2.1

- Relax dependencies constraints (@akshaynexus)

## 3.2.0+1

- Update lint dependencies
- Reformat code

## 3.2.0

- Allow bigger Kotlin/Gradle versions (fixes #43)
- Bust iTunes cache when fetching the published plugin version (fixes #45)
  - Thanks to @millerf for the contribution!
- Upgrade dependencies

## 3.1.0

- Support for Android namespace
- Update to Android `compileSdkVersion 34`
- Upgrade `flutter_lints` to `^3.0.2`
- Support for `package_info_plus: '>=4.0.2 <9.0.0'` on iOS

## 3.0.1

- Support for `package_info_plus: ^5.0` on iOS
- Upgrade `flutter_lints` to `^3.0.1`

Thanks to @kuhnroyal for these changes!

## 3.0.0

- Require Dart 3.0 or later
- Add `base`, `final`, and `sealed` modifiers to some classes
- Remove `when` and `whenOrElse` methods from `Availability`
  - Now that `Availability` is `sealed`, you should use `switch` instead
- Use `HttpClient` instead of the `http` package, removing the later from the dependencies
- Provide more tests

## 2.3.0

- Bumped Kotlin version to 1.5.31, as required by Flutter 2.10 and greater (fixes #28)
  - Because of this, minimum Dart SDK versions is now 2.16
- Updated some dependencies versions
- `package_info_plus` on iOS updated to `^4.0.2`

## 2.2.1

- Fixed critical issue that made the plugin break on Android (#21). Thanks to @kuhnroyal for solving the issue!

## 2.2.0

**Warning:** This version has a critical issue and won't work on Android (#21). Please, use 2.2.1 instead.

- Update dependencies
  - Specially, the package `package_info_plus` version was preventing this package to be used with updated Flutter dependencies
  - Thanks to @otopba for the PR (#15)!
- Update Android implementation to plugin v2
- Use federated plugin structure for iOS (#7)
- Add the parameter `iosAppStoreRegion` to `getAvailability`
  - As requested in #10, this parameter allows one to set which region to look for in the AppStore. The default region makes the search fail if your app is published in a different region
  - Thanks to @rkfcccccc for the PR!
- Fix error that happened when using the package with other packages that used the Google API (#18)
  - Thanks to @otopba for identifying the issue and providing the PR!
- Set the minimum Flutter SDK version to `>= 2.8.0`
  - The package didn't work in versions minor tha `2.8.0`, but the package was targeted to `>= 2.0.0`
  - Thanks to @kuhnroyal for identifying the issue and providing the PR!
- Some improvements in CI/CD and development
  - Thanks to @kuhnroyal for helping with this!

## 2.1.0

- Replace `package_info`, which is deprecated, with `package_info_plus`

## 2.0.0

- *Null-safety* bump to stable
- Dependencies versions bump

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. **@ashishbeck** [thinks it's OK to be published as *stable*](https://github.com/mateusfccp/update_available/issues/5#issuecomment-797945264), so I am doing it. If you find any issue, please report.

## 2.0.0-nullsafety

- Migration to *null-safety*
- Changed `version` to `pub_semver`

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. I am going to ask to someone to test it for me and, as soon it's safe to be used in production, I publish it as stable.

## 1.0.0+1c

- Added trivial example

## 1.0.0+1b

- Document `getUpdateAvailability()`

## 1.0.0+1

- Update README.md

## 1.0.0

- Initial version
