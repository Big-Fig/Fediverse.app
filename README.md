# Fedi for Pleroma and Mastodon

A client for Pleroma and Mastodon instances written using Flutter

### Android

* [Google Play](https://play.google.com/store/apps/details?id=com.fediverse.app) 
* [Google Play Beta](https://play.google.com/apps/testing/com.fediverse.app)

### iOS

* [AppStore](https://apps.apple.com/us/app/fedi-for-pleroma-and-mastodon/id1478806281) 
* AppStore TestFlight Beta **(coming soon)**

### Releases

* [GitHub Releases](https://github.com/Big-Fig/Fediverse.app/releases)
* [CHANGELOG](https://github.com/Big-Fig/Fediverse.app/CHANGELOG.md) 

## Features

- Pleroma and Mastodon support
- Offline mode. Access to cached data event without network
- Custom emojis. With emoji reactions support on Pleroma
- Customizable home timelines
- Multi-account support
- Push notifications via Push Relay Server and FCM(see details below)
- Income and external share support
- Scheduled and Draft Statuses
- Filters
- Instance details, announcements, trends, activity history, limits
- Day & Night theme
- Bookmarks, Hashtags, Lists, Featured tags, Suggestions
- Messenger-like UI for Conversations(DM) and Pleroma chats
- Customizable real-time notifications & timeline updates via WebSockets and Push Notifications
- Fetch data from Remote instances via Public API. So you can access full date on remote instance if currently logged instance didn't synchronized all data yet
- A lot of settings options(global or per-instance). For example: `Always show NSFW` or `Auto-load media content`
- Threads & Polls
- Special UI for media-only timelines
- Mutes & Blocks
- Editing profile
- Sign up support

## Coming soon

* Rich notifications(actions, layouts, grouping, channels)
* Admin API
* Support other Fediverse instances: Pixelfed, Misskey, Peertube, GNU Social, Friendica and others
* Pleroma: scrobbles, mascot and recently added new features
* Mastodon: recently added new features. 
* Adopt UI for large screens
* Display timelines from different instances on single Home page(currently you should switch instances to see related data)
* Remember timeline position via Markers API
* OnBoarding & Tutorial. Popular instances suggestions
* A lot of minor UX improvements in backlog

Feel free to open issues if you have suggestions

## Known issues

* Text not selectable, but you can copy or share whole statuses
* Instances with special chars like `ü` not supported

## Data gathering

### Crash reports via Firebase Crashlytics

* You can build app from source and remove Crashlytics via .env config(details below)
* Option to disable Crashlytics gathering inside App **(coming soon)**


## Push notifications

Push notifications implemented via Web Push Relay(Proxy) server

Web Push Relay is Ruby on Rails server which handle Web pushes and proxy them to FCM

* LINK TO PUSH RELAY REPO **(coming soon)**

1. Fedi subscribe to `/api/v1/push/subscription` with `subscription[endpoint]` set to relay server URL
2. Instances send Web push notifications to relay server
3. Relay server relay notifications to Fedi app via FCM
4. Fedi display notifications

* Notifications are not enabled by default and Fedi ask you about notification after login. 
* You can also disable notifications later in any time.
* You can completely remove FCM and Push Relay Usage(or use your own FCM credentials and Push Relay server instance)

### Which data Push Relay server have access?

```
 {
   "access_token""=>""QiQGKu6wAsF6M3bWJ3FMTvfK_rW...",
   "body""=>"@jffdev2: @jffdev hello world",
   "icon""=>""https://fedi.app/images/avi.png",
   "notification_id"=>1114,
   "notification_type""=>""mention",
   "pleroma""=>"{
      "activity_id""=>""A82wvAgZu7n7B...",
      "direct_conversation_id"=>42..
   },
   "preferred_locale""=>""en",
   "title""=>""New Direct Message"
}
```

* As you can see server sent `body` which may have private data(like private Status body) and `access_token`
* `access_token` is sensitive data. It is possible to login to your account if someone know `access_token`
* Fedi and Proxy server doesn't actually need `access_token`, because Fedi mobile app already have it once you logged in
* Once Mastodon and Pleroma devs add additional optional argument to `/api/v1/push/subscription` to exclude `access_token` from notification payload.

## Localization

### Completed

* English, Russian

### Help translate Fedi

* Help translate Fedi with [Weblate](https://translate.pleroma.social/projects/fedi-app/)
* It is easy to suggest fixes even without registering


## License

* **Coming soon**

## Feedback

* The best option is to create issue for this repository

## For developers

* Null-safety support
* Feature-based folder structure
* Dependency Injection implemented via `provider`
* Prefer `StatelessWidget` and async UI update via `StreamBuidler` and `BehaviourSubject` & `StreamController` in controller classes
* Prefer divide `Widgets` in small sub `Widgets` with `const` constructor(for better performance) if possible
* Provide data to nested elements via `provider`
* Prefer `Repository` pattern. Almost all network data cached in local SQLite database. UI always display data from single source. It may be network-only or from database(if data cached). Don't cache and merge data in memory to achieve data consistency
* Prefer [Effective Dart](https://dart.dev/guides/language/effective-dart/style) name and style code conventions
* Prefer long file & classes names like `account_follower_account_cached_list_bloc_impl.dart` and `AccountFollowerAccountCachedListBloc`
 * It easy to understand what class do
 * It easy to navigate in IDE by typing start letters of name
* One class = one file
* Prefer `interfaces` for `Bussines Logic` and `Services` 
 * Simple append `I` to implementation class name. `AccountFollowerAccountCachedListBloc` implementation and `IAccountFollowerAccountCachedListBloc` interface
 * Code readability: you can see small list of public methods/fields in interface file instead of exploring long file with implementations
 * It useful to implement extensions for interfaces not for implementations
 * It useful to extends several interfaces in one child to separate logic
 * It useful to create tests and mocks


### Flutter version & FVM 

To build Fedi you need Flutter version specified in [`.fvm/fvm_config.json`](.fvm/fvm_config.json) field `flutterSdkVersion`. You can achieve this by simple using `flutter version $version` or using FVM

### Flutter Version Management(FVM)

Fedi uses [Flutter Version Management](https://github.com/leoafarias/fvm) to clearly specify Flutter version to build app.

FVM also helps manage several SDKs version on local machine

Config already done, so you just run `fvm install` in repo folder and configure IDE to use `.fvm/flutter_sdk` folder instead of system Flutter SDK. 

More info you can found in FVM documentation 

### Libraries

- [`moor`](https://pub.dev/packages/moor) is SQLite ORM. For local data cache & offline mode support
- [`hive`](https://pub.dev/packages/hive) is secure and fast storage for preferences
- [`provider`](https://pub.dev/packages/provider) for Dependency Injection
- [`flutter_html`](https://pub.dev/packages/flutter_html) for content rendering
- [`rxdart `](https://pub.dev/packages/rxdart) for reactive programming
- [`pedantic`](https://pub.dev/packages/pedantic) & [`dart_code_metrics`](https://pub.dev/packages/dart_code_metrics) for better code analyzing. See [`analysis_options.yaml`](analysis_options.yaml) for enabled rules
- [`flutter_cache_manager`](https://pub.dev/packages/flutter_cache_manager) for media caching
- `flutter_intl` for localization via `.arb` files
- A lot of UI-related(like [`pull_to_refresh`](https://pub.dev/packages/pull_to_refresh)) and Platform-dependent(like [`permission_handler`](https://pub.dev/packages/permission_handler)) libraries
- [`flutter_config`](https://pub.dev/packages/flutter_config) to config via .env files

You can find full list in [`pubspec.yaml`](./pubspec.yaml) where each library have comment why it's used 

### Icons

* Fedi uses vector icons compiled in icon font via [fluttericon.com](https://www.fluttericon.com/)
* folder [icons_export](./icons_export) contains config for [fluttericon.com](https://www.fluttericon.com/) currently used by Fedi

### Tests

* Fedi have unit-tests for Business Logic and Services classes
* Integration & UI tests not implemented yet

### Backlog

* You can explore [Fedi Trello board](https://trello.com/b/kLFe7CEL/fedi) for known issues and current work progress

### How to build from source

##### Clone repository

`git clone https://github.com/Big-Fig/Fediverse.app`

##### Go to repository folder

`cd Fediverse.app`

##### Install FVM

Install Flutter version used by this project

`fvm install`

##### Copy default .env config

Copy config for `prod` and `dev` flavors

```
cp env_example.env env_prod.env
cp env_example.env env_dev.env
```

Example config disable some features like **Push notifications**. 

To enable **all features** you should change app id, create Firebase project and edit config file(see below).

##### Run

###### Run from command line

```
fvm flutter run --flavor dev
``` 

or

```
fvm flutter run --flavor prod
```

###### Run from IDE

Specify flavor(`prod` or `dev`) in `Run Configurations`

#### Flavors

There are two flavors. 

*Implementation details:* [Build flavors in Flutter (Android and iOS) with different Firebase projects per flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)

###### prod

Used for production builds

###### dev

Used for development builds. You can use only prod flavor if you don't need special config for development

#### Config

Main purpose of config files is to exclude sensitive data from source control and quickly enabled/disable and config some features like Push Notifications

Build script uses config from project root folder depends on flavor, so to build app you should have next files in root folder

```
env_prod.env
env_dev.env
```

Those files excluded from source control.

You can find all possible config variables(with comments) at [env_example.env](env_example.env)


```
APP_ID=com.fediverse.app
APP_TITLE=Fedi
#APP_APPLE_ID=147880...
LOG_ENABLED=true
FIREBASE_ENABLED=false
PUSH_FCM_ENABLED=false
#PUSH_FCM_RELAY_URL=https://pushrelay.example.com/push/
#PUSH_SUBSCRIPTION_KEYS_P256DH=BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8qu
#PUSH_SUBSCRIPTION_KEYS_AUTH=T5bhIIyre5TDC
CRASHLYTICS_ENABLED=false
ASK_REVIEW_ENABLED=false
#ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW=5
```

#### If you have strange errors in any case or how to clean project

* `fvm flutter clean`
* `./gradlew clean` in android folder
* `Product->Clean` in XCode

Sometimes it also need to clear iOS pods

```
cd ios
rm -rf Pods
rm Podfile.lock
pod install
```

#### App ID


Changing App ID is required if you want to setup own Push Relay server and pushes via your Firebase project for FCM. 

It also useful if you want to have several app versions installed on one device

Unfortunately, it is not possible to use APP_ID from config in all places in Gradle and XCode project files. So in some places ID is hardcoded

So, If you want to change app id from `com.fediverse.app` for `prod` and from `com.fediverse.app2` for `dev` you should manual changes (in additional to changes id in `.env` files)

Actually you should run Find and Replace `com.fediverse.app` with your package name on `ios` and `android` folders. And rename folders at `android/app/src/main/kotlin`

However, it may cause strange build errors. So you may need full clean

If you still have errors please explore APP ID things in the next docs: 

* [Build flavors in Flutter (Android and iOS) with different Firebase projects per flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)
* [`flutter_config`](https://pub.dev/packages/flutter_config)  
* [`firebase_core`](https://pub.dev/packages/firebase_core)
* [`firebase_crashlytics`](https://pub.dev/packages/firebase_crashlytics)
* [`firebase_messaging`](https://pub.dev/packages/firebase_messaging)
* [`receive_sharing_intent`](https://pub.dev/packages/receive_sharing_intent)

#### Firebase

To use Firebase service you should generate files from your Firebase project page and put in project.

Don't forget to enable in `.env` file

`FIREBASE_ENABLED=false`

####### Android

* Generate `google-services.json`

Put `google-services.json` to folder depends on used flavor

* `android/app/src/dev`
* `android/app/src/prod`

###### iOS

* Generate `GoogleService-Info.plist`

Put `GoogleService-Info.plist` to folder depends on used flavor

* `ios/config/dev`
* `ios/config/prod`

For more details see

* [Flutter Firebase documentation](https://firebase.flutter.dev/docs/overview) 
* [Build flavors in Flutter (Android and iOS) with different Firebase projects per flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)

#### Push notifications 

```
PUSH_FCM_ENABLED=false
```

##### Firebase Cloud Messaging (FCM)


```
PUSH_FCM_RELAY_URL=https://pushrelay.example.com/push/
PUSH_SUBSCRIPTION_KEYS_P256DH=BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8qu
PUSH_SUBSCRIPTION_KEYS_AUTH=T5bhIIyre5TDC
```

##### Proxy Push Relay Server

```
PUSH_FCM_RELAY_URL=https://pushrelay.example.com/push/
PUSH_SUBSCRIPTION_KEYS_P256DH=BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8qu
PUSH_SUBSCRIPTION_KEYS_AUTH=T5bhIIyre5TDC
```

#### Firebase Crashlytics

```
CRASHLYTICS_ENABLED=false
```

Used to catch errors on client side with error description and stackTrace

You should enable Firebase support(see above) and change config variable in .env file to enable crash reporting

#### Receiving share intents & ShareExtension
