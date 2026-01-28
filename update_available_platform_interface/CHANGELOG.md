## 4.1.1

- Relax dependencies constraints (@akshaynexus)

## 4.1.0+1

- Update lint dependency

## 4.1.0

- Provide error information on `UnkownAvailability` object for when the method channel returns a `PlatformException`
- Upgrade dependencies

## 4.0.1

- Upgraded `flutter_lints` to `^3.0.1`

## 4.0.0

- Requires Dart 3.0 or later
- `UpdateAvailablePlatform` can't be implemented anymore (just extended)
- `Availability` is now a `sealed` class
- Removed `when` and `whenOrElse` from `Availability`

## 3.1.0

- Minimum Dart SDK versions is now 2.16
- Updated some dependencies versions

## 3.0.0

- Update dependencies
- *Breaking change:* now, the method `getUpdateAvailability` has an optional named parameter `String? iosAppStoreRegion` (#11)

## 2.0.0

- *Null-safety* bump to stable
- Dependencies versions bump

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. **@ashishbeck** [thinks it's OK to be published as *stable*](https://github.com/mateusfccp/update_available/issues/5#issuecomment-797945264), so I am doing it. If you find any issue, please report.

## 2.0.0-nullsafety

- Migration to *null-safety*
- Changed `version` to `pub_semver`

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't propertly test it. I am going to ask to someone to test it for me and, as soon it's safe to be used in production, I publish it as stable.

## 1.0.1+1b

- Improved documentation

## 1.0.1+1

- Updated README.md

## 1.0.1

- Downgrade `meta` to `^1.1.8`

## 1.0.0

- Initial version
