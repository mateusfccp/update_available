# update_available

[![Version](https://img.shields.io/pub/v/update_available)](https://pub.dev/packages/update_available)
[![License](https://img.shields.io/github/license/mateusfccp/update_available)](https://opensource.org/licenses/MIT)

## Features

 * Provide a simple, single function to get update availability for your Android or iOS app.
 * Version checking based on published app version.
 * Foldable structure so that you have compile-time exhaustive check.

 ## Getting started

 Add `update_available` as a dependency in your `pubspec.yaml`:

 ```yaml
 dependencies:
    update_available: ^2.0.0
 ```

 Update your packages with `flutter pub get`.

 ## Usage

 `update_available` provides a single function, `getUpdateAvailability`. This function is assynchronous, and will thus return a `Future<Availability>`. 

 `Availability` is an object with three possible state:

  * `UnknownAvailability`, for when the function couldn't determine the availability of an upgrade, possibly caused by an error.
  * `NoUpdateAvailable`, for when there's no update available, i.e. the installed app is up to date.
  * `UpdateAvailable`, for when there's an update available, i.e. the installed app is not the last version published.

You can also set the named parameter `iosAppStoreRegion` for that function to specify the region (according to ISO 3166-1 alpha-2) in which the iOS version will be checked.

To exhaustively check against these three possibilities, `Availability` provides the `fold` and `foldElse` functions, which receive functions for each case and thus guarantee compile-time exhaustive check.

You can get more details about `Availability` in the [source code](https://github.com/mateusfccp/update_available/blob/master/update_available_platform_interface/lib/src/availability.dart).

### Example

```dart
void printAvailability() async {
    final updateAvailability = await getUpdateAvailability();

    final text = updateAvailability.fold(
        available: () => "There's an update to you app! Please, update it "
                         "so you have access to the latest features!",
        notAvailable: () => 'No update is available for your app.',
        unknown: () => "It was not possible to determine if there is or not "
                       "an update for your app.",
    );

    print(text);
}
```

## Why use this package instead of alternatives?

There are good alternatives to this package that have a similar purpose.

 * [in_app_update](https://pub.dev/packages/in_app_update): If you want a quick way to upgrade your app with the In App Updates feature of Android API, this package is the way to go.
 * [upgrader](https://pub.dev/packages/upgrader): It is another complete solution that provides both an alert and card widgets that shows you a message about the availability of an update. It has support to both Android and iOS, Appcast and also exposes the iTunes search API to be used standalone if you want.

These are the two packages that I came through when looking for a solution for update availability on Flutter. However, these two didn't match my use-case, because of the following:

 * Both of them provided user interfaces regarding the availability.
 * `upgrader` is not reliable when dealing with Android unless you use Appcast.
 * I wanted the bare minimum neccessary.

So, `update_available` is better fit to you if:
 * You want support for both iOS and Android.
 * You want the bare minimum information about availability so you can build your own upgrade screen.

## How to test this plugin in Android

The Android implementation for this plugin uses the Android In App Update API to check for update availability. Because of this, you won't be able to test if this is properly working while debugging locally, as your local version is not published on the Google Play Store.

To test this plugin on your app, you will have to make the following procedure:

 1. First, setup your Internal App Sharing with the help of [these instructions](https://support.google.com/googleplay/android-developer/answer/9303479?hl=en). Unlike Internal Testing Track, Internal App Sharing makes the app available immediately, so there is no waiting time.
 2. Opt-in to app signing by Google Play. This will allow google play to sign the apk generated for the device from the app bundle you provide. Details [here](https://support.google.com/googleplay/android-developer/answer/7384423?hl=en).
 3. Build your Android app bundle. Through command line, it is simply `flutter build appbundle`.
 4. Go to https://play.google.com/apps/publish/internalappsharing/ and upload the generated `.aab` file which is under `build/app/outputs/bundle/release/`. Give a decent name that includes version code.
 5. This will provide a link to copy. Use it to install this bundle to your device.
 6. Bump the version code in your app `pubspec.yaml` and build another bundle. Note: Version code is the integer part after the `+` sign. That's what is to be incremented. Version name is different and it doesn't matter for this. So, for example, you can simply bump from `1.0.0+1` to `1.0.0+2`, but you can't bump `1.0.0+1` to `1.0.1+1`.
 7. Similarly, upload this new bundle to Internal App Sharing. Name it with the version code.
 8. This will provide another link. Open this link on your device and this will open Google Play, and you should see the "Update" option. Don't click on Update!
 9. Open your app and now you should see in-app update prompt.

These steps have been adapted from [rpattabi's answer](https://stackoverflow.com/a/59266778/3055725) to [this question on StackOverflow](https://stackoverflow.com/questions/56087064/how-can-i-test-in-app-updates-in-android). All credits goes to him.