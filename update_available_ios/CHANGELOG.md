## 3.0.1

- Supported `package_info_plus` 5
- Upgraded `flutter_lints` to `^3.0.1`

## 3.0.0

- Requires Dart 3.0 or later
- `UpdateAvailableIosPlugin` can't be implemented, extended or mixed anymore
- `http` removed from the dependencies
- Provide some additional tests

## 2.3.0

- Minimum Dart SDK versions is now 2.16
- Updated some dependencies versions

## 2.2.0

- Update dependencies
- Use federated plugin structure for iOS (#7)

## 2.1.0

- Replace `package_info`, which is deprecated, with `package_info_plus`

## 2.0.0

- *Null-safety* bump to stable
- Dependencies versions bump

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't properly test it. **@ashishbeck** [thinks it's OK to be published as *stable*](https://github.com/mateusfccp/update_available/issues/5#issuecomment-797945264), so I am doing it. If you find any issue, please report.

## 2.0.0-nullsafety

- Migration to *null-safety*
- Changed `version` to `pub_semver`

**Disclaimer:** I think that it's correctly working, but as I am not using *null-safety* in production yet, I couldn't properly test it. I am going to ask to someone to test it for me and, as soon it's safe to be used in production, I publish it as stable.

## 1.0.1+1d

- Fix typo on documentation

## 1.0.1+1c

- Revert changes on `pubspec.yaml`, as pub.dev won't accept a plugin declaration without native integration

## 1.0.1+1b

- Update README.md

## 1.0.1+1

- Add platform to pubspec.yaml

## 1.0.1

- Remove pubspec.lock

## 1.0.0

- Initial version
