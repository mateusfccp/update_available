## 2.2.0

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
