# Fedi for Pleroma and Mastodon


* [Release notes](https://github.com/Big-Fig/Fediverse.app/releases)
* Stable releases once per 1-2 month
* Beta releases once per 1-2 weeks

### Android

* [Google Play](https://play.google.com/store/apps/details?id=com.fediverse.app) 
* [Google Play Beta](https://play.google.com/apps/testing/com.fediverse.app)

### iOS

* [AppStore](https://apps.apple.com/us/app/fedi-for-pleroma-and-mastodon/id1478806281) 
* AppStore TestFlight Beta



## Features

- Pleroma and Mastodon support
- Offline mode. Access to cached data event without network
- Custom emojis. With emoji reactions support on Pleroma
- Customizable home timelines
- Multi-account support
- Push notifications
- Income and external share support
- Scheduled and Draft Statuses
- Filters
- Instance details, announcements, trends, activity history, limits
- Day & Night theme
- Bookmarks, Hashtags, Lists, Featured tags, Suggestions
- Messenger-like UI for Conversations(DM) and Pleroma chats
- Customizable real-time notifications & timeline updates via WebSockets or Push Notifications
- Fetch data from Remote instances via Public API. So you can access full date on remote instance if currently logged didn't synchronized all data yet
- A lot of settings options(global or per-instance). For example: `Always show NSFW` or `Auto-load media content`
- Threads & Polls
- Special UI for media-only timelines
- Mutes & Blocks
- Editing profile
- Sign up support


## Coming soon


* Rich notifications (actions, layouts, grouping, channels)
* Admin API
* Support other Fediverse instances: Pixelfed, Misskey, Peertube, GNU Social, Friendica and others
* Pleroma: scrobbles, mascot and recently added new features
* Mastodon: recently added new features. 
* Adopt UI for large screens
* Display timelines from different instances on single Home page (currently you should switch instances to see related data)
* Remember timeline postition via Markers API
* OnBoarding & Tutorial. Popular instances suggestions
* A lot of minor UX improvements in backlog

Feel free to open issues if you have suggestions

## Known issues

- Text not selectable, but you can copy or share whole statuses
- Instances with special chars like `ü` not supported

## Data gathering

App uses only Firebase Crashlytics to gather stacktraces for bugs.

We plan to add option to disable Crashlytics gathering

## Push notifications

* LINK TO PUSH RELAY REPO

Push notifications implemented via Web Push Relay (Proxy) server. 

1. Fedi subscribe to `/api/v1/push/subscription` with `subscription[endpoint]` set to proxy server.
2. Instances send Web push notifications to relay server.
3. Relay server proxy notifications to Fedi app via FCM
4. Fedi display notifications

Notifications are not enabled by default and Fedi ask you about notification after login. You can also disable notifications later in any time.

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

* As you can see server sents `body` which may have private data (like private Status body) and `access_token`
* Fedi and Proxy server doesn't actually need `access_token`, because Fedi mobile app already have it once you logged in
* We plan to ask Mastodon and Pleroma devs to add additional optional argument to `/api/v1/push/subscription` to exclude `access_token` from notification payload. If that don't suit for you shouldn't enable push notification in Fedi


## Localization

### Full support

- English, Russian


## License

## Feedback

The best option is to create issue for this repository

## For developers

Feature based

### SDK version & FVM 

* `.fvm/fvm_config.json`

### Libraries

- Moor is SQLite ORM. For local data cache & offline mode support
- Hive is secure and fast storage for preferences
- Provider for Dependency Injection
- Flutter HTML for content rendering
- RxDart for reactive programming
- Pedantic & dart_code_metrics for better code analization
- `flutter_cache_manager` for media caching
- `flutter_intl` for localization
- A lot of UI-related (like `pull_to_refresh`) and Platform-dependend (like `permission_handler`) libraries

You can find full list in `pubspec.yaml` in the repo root where each library have comment why it's used 

### Test coverage

### Icons

https://www.fluttericon.com/

### Backlog

- fix all TODO in code
- extract some code to dart packages. For example Pleroma/Mastodon API wrappers
- implement rest with Dio + retrofit
- more tests
- CI/CD integration
- Refactor: websockets, datetime picker, emoji picker, duration picker

### How to build from source

#### Flavors

#### App id

#### Push notifications 

##### Firebase Cloud Messaging (FCM)

##### Proxy Push Relay Server

#### Crashlytics (catch exceptions)

