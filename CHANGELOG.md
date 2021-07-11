## Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## Unreleased

### Changed
* update cover image in README.md
* remove settings from about_page.dart to avoid errors when user not logged in yet
* display only local accounts on instance directory page
* better context for guest mode
* improve notification_list_item_widget.dart: perform notification actions as pleroma async operation without blocking dialog

### Fixes
* fix version url in about_page.dart
* guest mode fixes for media
* fix push notifications on mastodon
* fix async_dialog.dart: don't crash when performing async operation without actual dialog
  

## [2.6.0] [internal] 2021 July 10

### Added
* Server-list autocomplete
* `Explore as guest` feature to view instances data via Public API
* About page
* More lint rules

### Changed
* Much better registration UI, UX & logic
* Specify package versions explicitly in pubspec.yaml
* update libraries and Flutter
* update Readme
* resubscribe to PushRelay if PushRelay server URL is changed
* move Disposable logic to `easy_dispose_*` packages

### Fixes
* Fix mocks for some unit tests
  

## [2.5.0] [internal] 2021 June 22

### Added
* Push notifications rich layouts: big text, big image, default
* Push notifications actions: reply to chat/mention, accept/reject follow request.

### Changed
* **BREAKING. Push notifications rework**. Add support for new **version of PushRelayServer which don't decrypts message on server side**.
Fedi don't decrypt pushes too(it is not easy too implement and will be added later). Fedi use encrypted push message as trigger to load latest notification and display it to user. See more in Readme
* You should **re-subscribe for push notifications inside app to use new push relay server**. Otherwise you will see old behaviour.
* Update Readme: describe receive_sharing_intent and iOS group ids
* Update Readme: push notifications
* Remove empty time ago prefixes from localization
  

## [2.4.2] [internal] 2021 June 18

### Changed
* Update receive_sharing_intent to own fork which support custom Apple Group ID & Flavors
* Update XCode project related to receive_sharing_intent changes & moving app to different iTunes account

## [2.4.1] [internal] 2021 June 16

First open-source release

### Added

* README
* CHANGELOG
* LICENSE
* On/Off Crashlytics handling settings option
* config via .env files
* On/Off firebase, FCM push, Crashlytics, Ask Review features 

### Changed
* Ask for something dialog
* Rework sharing UI & logic. Add more options for share. Divide share in several messages if attachments limit reached

### Fixes
* Add hacks in REST API parsing related to internal flutter errors
* Additional checks to avoid non-fatals in UI when data is not ready yet but UI want display it
* Fix preview for messages with html tags
* Fix clear database cache option
* Fix count limit option for files cache

## [2.3.0] [internal] 2021 June 6
### Added
* handle incoming share events
* hashtag timeline page for remote instances
* public timeline for remote instances
* settings support for remote instance timelines

## [2.2.0] [internal] 2021 May 30
### Added

* featured tags
* endorsements
* instance activity
* trends
* instance directory

## [2.1.2] [stable]
### Fixes

* hotfixes to make stable release from 2.0.54

## [2.0.54] [internal] 2021 May 15
### Added
* add pagination to chats (use v2 API)

### Changed
* better ‘onlyFromInstance’ timeline filter performance
* improve starting new chat UX
* improve deleting API wrappers. Don’t throw exception if record not found
* mark notification as read if user opened app by clicking on it
* handle localization settings for datetime picker
* better performance for dynamic calculating newly arrived items
* listen filters changes and dynamically apply them without refresh currently visible screen
* add more lint rules for better code quality

### Fixes
* fix too long ru & en localizations
* minor bugfixes and performance improvements
 
## [2.0.53] [internal] 2021 May 10
### Added
* add media attachment reupload service: improve share media and status with single media
* add show/hide animation to merge new items button overlay for lists
* add hideTotals support in poll API
* 
### Fixes
* fix deleting scheduled status
* fix non-media item widget
* fix chat message layout: media padding and text align
* fix ‘unable to attach media’ on timelines screen.
* fix warnings for fedi list smart refresher refresh indicator
* fix deleting single conversation
* fix with_new_items: don’t duplicate own posts
* fix loading progress indicator size for images in Html widget

### Changed
* multi select dialog UX
* improve clicking on mention. Don’t load from remote if exist in local cache
* better card widget for content with html tags.
* better share: exclude html tags from status sharing
* improve share media/chat selection/status as new status
* improve fedi circular progress indicator for lists. 
* Use fedi instead material indicator in positioned list on Thread screen
* resort with_new_items dynamically. Applied for chat/conversation lists
* improve post status start conversation. Move send action to appbar
* improve start conversation on pleroma: add hack for conversation websockets event when conversation accounts is empty
* improve list refresh indicator size
* remove junks (use compute) in with_new_items lists
* improve move notification handling
* parse json from rest api in async compute
* remove warnings in fedi_list_smart_refresher_refresh_indicator.dart
* improve switch: use library instead own implementation. Animation added
* rework smart refresher: Refresh indicator
* libraries update

## [2.0.52] [internal] 2021 May 2

### Added
* a lot of new unit-tests

### Fixes
* minor bugfixes for issues found by new test

## [2.0.51] [internal] 2021 April 18
### Changed
* improved websockets logic. Better performance + less battery usage

### Fixes
* bug fixes

## [2.0.49] [internal] 2021 April 13
### Changed
* local database logic refactoring and optimization

## [2.0.47] [internal] 2021 April 3
### Changed
* design update for chats, muting, media selection, dialogs and much more
* updated to Flutter 2.0. All libraries was updated to never versions. 
* source code was refactored to support null-safety


## [2.0.46] [internal] 2021 March 13
### Changed
* faster app starting
* handling pleroma notifications unread field
* conversations/chats and notifications unread logic improvements

## [2.0.45] [internal] 2021 March 7

### Fixes
* fix chats fetching. Chats don’t support pagination yet but Fedi sent it by default. In latest update fedi.app start return error for chats endpoint if it has pagination arguments. So I removed pagination args until pagination will be implemented
* fix slow scroll in Thread Page to initial status
* fix rare crashes on Android when downloading media

### Changed
* improved input text fields UX: remove keyboard focus/unfocus blinking when user taps on input field to move cursor or select text
* switch UX
* show followRequestCount badge when followRequest notification arrives
* better click on hashtag UX: ask user if hashtag on remote instance. Open in browser on remote instance or open in app on local instance.
* support chat message selection for failed messages


## [2.0.44] [internal] 2021 February 27
### Added
* add confirm dialog for delete chat/conversation
* enabled expire_in support for filters on Pleroma

### Changed
* auto-reload images when connection restored
* improve select many from list dialog UX

### Fixes
* fix text overflow bug in chat previews

## [2.0.43] [internal] 2021 February 14
### Added
* add media picker current selection UI

### Changes
* improve chat/conversations UI/UX. Don’t block UI during sending message. It is possible to re-send failed message

### Fixes
* fix appName during register app on instance
* a lot of minor UX fixes


## [2.0.42] [stable] 2021 February 8
### Added
* expire_in support for publish statuses
* timed account mute + mute UI rework
* badge when user have active follow request
* delete & re-post/re-draft actions
* more options to timeline filters: replyVisibility, excludeVisibilities, onlyFromInstance
*more unit tests
 
### Changes
* rework delete UI

### Fixes
* minor bugfix
* localization fixes 

## [2.0.40] [internal] 2021 January 31
### Added
* chat & conversations long tap to select messages and actions: share, copy, delete
* delete conversation
* add support for pleroma only visibilities: local & list
* add idempotencyKey support to post status & post chat message
* add selected chat message option: share. Improve share status logic

### Fixes
* fix media attachments display: use reblog media attachment if reblog exist

### Changes
* create poll UX

## [2.0.39] [internal] 2021 January 27
### Fixes
* hotfixes & UI/UX improvements for 2.0.38 related to remote instance data fetching

## [2.0.38] [stable] 2021 January 26
### Added
* Instance information Page with full instance details from /api/v1/instance endpoint
* Load account and statuses(and threads) via public API from remote (origin) instances

### Fixes
* fixed several minor bugs

## [2.0.36] [internal] 2021 January 18
### Added
* subscribe on specific account statuses (pleroma only)
* add favourites tab in account details page (pleroma only for non-own accounts).
* multi-selection support for media files
* handle in UI hide follower/followings/favourites account fields

### Changes
* better error messages
* registration rework and improvements: add reason  language field. Handle approvalRequired & confirmationEmailSent cases

### Fixes
* fixed account add/remove to List.
* fixed account Note edit on Mastodon
* fixed Only Fun integration: chat issues

## [2.0.35] [internal] 2021 January 4
### Added
* database & files cache limits options

## [2.0.34] [internal] 2020 December 22
### Added
* more settings options

### Changes
* apply filter when fetch data from local cache
* delete all cached data on logout

### Fixes
* a lot of minor bugfixes

## [2.0.33] [internal] 2020 December 14
### Added
* ask for review popup (will work only in Fedi1 release builds loaded from AppStore/GooglePlay)
* account muting options

### Changes
* share improvements: account selection rework & add recent feature, share status UI improvements
* better auth token revoked handling
* filters support. API wrapper implemented, but local filtering for already cached statuses not ready yet

## [2.0.32] [internal] 2020 December 8
### Changes
* custom list edit/create UI rework
* notifications list UI improvements
* bookmarked/favourites posts UI rework
* scheduled/draft posts UI rework
* account blocks/mutes, domain blocks UI rework
* follow request UI rework

## [2.0.31] [internal] 2020 December 1

### Added
* in-app notifications feature
* more settings options

### Changes
* a lot of minor UI/UX improvements

### Fixes
* fix ios 14 non-safari default browser bug

## [2.0.30] [internal] 2020 November 23
### Changes
* forms refactoring & improvements: disabled state support
* settings rework: support custom per-instance settings and global settings storage

## [2.0.29] [internal] 2020 November 17
### Added 
* pleroma EmojiReaction notification settings
* RU localization

### Changes
* settings rework
* timelines managing improvements
* minor UI improvements

## [2.0.28] [stable] 2020 November 8
### Fixes
* fix android push notifications

### Changes
* global localization improvements
* global UI performance improvements
* DMs conversations now looks like chats. I decided to not remove it, because AppStore/Google play users leave feedback about that feature
* icons update
* a lot of UI/UX minor improvements
* better mastodon support

## [2.0.27] [internal] 2020 October 26
### Added
* adaptive dark theme colors (use system brightness)

### Changes
* slack-like input related
* text wrapping in input at timeline
* better dark theme colors
* switching account UI localisation improvements
* additional logic to handle login in chromium based browsers on Android
* additional dialogs to ask notification permission on start & describe notification proxy & error alert dialog

### Fixes
* fix emoji picker async init loading
* fix emoji picker recent category

## [2.0.26] [internal] 2020 October 19
### Added
* dark theme support (design update not ready yet, so I just modified architecture to support themes and inverted colors)

### Changes
* slack-like thread input (design update not ready yet, so I adopted slack implementation).
* performance improvements
* better notification messages
* better error handling

## [2.0.25] [internal] 2020 October 12
### Changes
* share rework (design & refactoring)
* video/audio player rework (design & refactoring)
* nsfw/spoiler blur & labels UI rework
* poll vote rework (design & refactoring)
* poll create/edit rework (design & refactoring)

### Fixes
* fix minor bugs

## [2.0.24] [internal] 2020 October 5
### Changes
* automatically append own posts to timeline
* add more details to login process to handle what going wrong
* don't display zero counters
* update crash handling library
* improve timelines performance: don't update data for timelines too often

### Fixes
* fix timeline tab indicator invalid color bug
* fix timeline rebuild after settings changes
* possible fixes for blue screen stuck & always instance dead error

## [2.0.23] [internal] 2020 September 28
### Added
* custom timelines managing (add, remove, sort)

## [2.0.22] [stable] 2020 September 22

### Added
* special 'request_follow' button for locked accounts
* a lot of new unit tests for better stability

### Changes
* update flutter framework libraries & all libraries. Should increase performance, but may cause unexpected bugs. Update was required due to conflicts between new libraries and old
* icon for bot accounts
* separate settings for each timeline. Remove unsupported filter options for some timelines

### Fixes
* fix notifications for mastodon.instances (related to https support on push relay server)

## [2.0.21] [internal] 2020 September 13
### Added
* account mutes, blocks, domain blocks feature
* status conversation mute action
* auto-add new notifications after notification tab switching. However, new logic forces scroll position to top after tab switching, so we loose old scroll state.
* sometimes stuck when click on notification (when notification from non-active instance).
* add timeout to all REST request to avoid freeze on poor connection
* dismiss single notification feature
* add android notifications channels
* Account settings: default visibility, always display spoilers, always display nsfw, mark media nsfw by default

### Changes
* Faster push notifications (changes on PushRelay Ruby proxy-server): unsubscribe from webpush notifications when target FCM device id already expired

### Fixes
* fix invalid font size for statuses when OS accessibility font size changed
* fix broken chat input field UI

## [2.0.20] [internal] 2020 September 7
### Added
* implemented flavors. Flavor will save time on creating feature builds. From now Fedi2(dev) and Fedi1(prod) will have different icons and title.
* add light grey background for focused status in thread. Display status actions only for focused status and first status in thread.
* add multi-select account UI (used for mentions, lists, etc)
* hashtag and lists real-time websockets update

### Changes
* remove html tags from sharing raw status text to external apps
* handle instance config registration limits (approval required, invites only)
* handle instance config account fields limits
* handle instance config post status & create poll limits
* add custom (per-account) pleroma background image account field support (display on home page & edit)
* better upload media error details in notification
* better refresh & load more error details in notification
* accept/reject follow request.
* handle follow requested in account details page
* dynamically increase timeago UI (without manual statuses refresh)
* dynamically expire poll (without manual refresh)

## [2.0.19] [internal] 2020 August 31
### Added
* bookmark/unBookmark statuses
* lists create/edit/add account/remove account/ and fetch statuses support.
* hashtags support: add in search, fetch statuses, handle click in status
* bookmarks and favourites statuses fetch support. Access from Account Settings Page
* delete status feature & handle delete status by other people websockets event
* added slider between attachments in media attachments details page
* added status bottom actions bar in status thread for replies. It is temporary solution. I will implement actions only for focused reply in the future to avoid too much UI elements on the screen

### Changes
* better start conversation input UI: added autofocus for input field

### Fixes
* fix bug: don’t search for old DM with same user during start conversation
* fix non-media attachments type & filename handling when description is empty
* fix search results ALL tab: group separators are valid now

## [2.0.18] [internal] 2020 August 24
### Added
* pin/unpin statuses support
* add statuses tabs (only media, with replies, without replies, pinned) to account page
* add edit status UI (for draft and scheduled posts)
* add drafts statuses feature
* add open account in browser dialog action to open account on home instance
* add “Subject” field in to post new status UI
* new nsfw action icon
* nsfw spoiler alert description update

### Changes
* minor performance changes

## [2.0.17] [stable] 2020 August 16

### Added
* add captcha support
* add captcha to registration if it is supported by server.
* add create poll UI

### Changes
* Better share. Share to Chats, DMs. Better external share.
* better UI for images with transparent background

### Fixes
* fix bug “can’t reply to DIRECT message in thread”
* fix video player crash for mp4 files without actual video track (audio only)
* fix a lot of minor issues from non-fatal issues reports gathered via Firebase.

## [2.0.16] [stable] 2020 August 6
### Added
* add x86_64 and arm64 architecture support. Previously app not worked on it

### Fixes
* fix several minor bugs from Firebase crash reports.

## [2.0.15] [internal] 2020 August 5
### Added
* poll view and vote support
* custom emoji picker support

### Changes
* emoji picker UI rework
* navigation to status/chat/account after click on notification
* dialogs UI improvements
* nsfw/spoiler alert UI rework. Fix double “tap to view” when status contains both nsfw and spoiler
* improve chat last message local storage performance.
* rework drawers UI. Turn them in subpages
* remove grey divider just before status actions

## [2.0.13] [stable] 2020 July 28
### Added
* add safe area wrappers for all pages to fix layout issues on iphone X

### Fixes
* fix form links bug

## [2.0.12] [internal] 2020 July 26
### Added
* highlight mentions in edit text field

### Changes
* ToS UI improvements
* better date picker UI
* handle session expired error response from pleroma
* better emoji picker popup dialog

### Fixes
* search tabs UI fix
* toggle emoji reaction fix
* start chat/conversation fix
* fix notification and timeline tabs unread badges
* fix image caching in Media Details Page

## [2.0.10] [internal] 2020 July 21
### Added
* html support in account note field
* splash UI
* all dialogs UI
* no network mode improvements
* account message action

## Changes
* tabs fading instead of clipping
* account fields new UI
* new search UI
* new date picker UI
* increase nsfw clickable area
* status thread reply input label
* new heart icon

### Fixes
* fix tabs border radius

## [2.0.9] [internal] 2020 July 12
### Changes
* performance improvements

## [2.0.8] [internal] 2020 July 3
### Added
* add video picking support
* tap to load support on account page
* add horizontal scroll for tabs for small screens

### Changes
* improve reply and chat input UI.
* forms improvements: UI & validation. (account edit & registration)
* refresh instance features on app start instead of one-time caching on login
* failed UI & reupload for media attachments
* improve search UI
* remove autocorrect on host edit text

### Fixes
* fix firefox login on android & fix chats is grey on iOS
* fix dismiss keyboard on login
* fix status bar color switching
* fix post status/chat message with not-uploaded media

## [2.0.7] [internal] 2020 June 28
### Changes
* account details new UI
* account edit new UI
* dialogs new UI
* account chooser new UI
* media picker new UI
* attach media new UI
* non-media files new UI
* error notification new UI
* modal bottom sheet new UI
* bug fixes

## [2.0.6] [internal] 2020 June 16
### Fixes
* fix “This instance don’t support chats yet” checking

## [2.0.5] [internal] 2020 June 15
### Added
* unknown attached file type support

### Changes
* better chat not implemented error
* hide keyboard on scroll
* better account relationship logic
* better search

### Fixes
* fix scrolling issues on some iOS devices
* fix firefox login on android.

## [2.0.4] [internal] 2020 June 14

### Added
* account followers/following page
* better media preview UI (audio, video carousel)
* emoji support everywhere & overflow (account user name and display name)

### Changes
* better status/account throttling
* bottom nav bar clickable area

### Fixes
* Chat API fixes
* fix reblogged status actions
* media attachment not enough space fix
* dont allow sign-in with already signed credentials
* improve splash UI
* better “Tap to load” and unread badges

## [2.0.3] [internal] 2020 June 5
### Fixes
* fix login on android with non-chrome browser
* new Chat API fixes
* registration fixes
* fix timelines scrolling issue on iOS

## [2.0.2] [internal] 2020 June 2
### Added
* timelines scrolling handling (floating & pinned UI elements).

### Changes
* new chats api improvements
* status thread improvements
* reply/reblog improvements
* unread badges improvements

## [2.0.1] [internal] 2020 May 28
### Added
* header background fetching from backend
* fully existing chats API support (with realtime updates via push API and background updates via push notifications)

### Changes
* better chats list - accounts loaded immediately
* new Chat design
* new Search design
* all old UI screens use new UI elements

### Fixes
* fix notification icon on android
* Fix select account to start chat
* fix: jump to original status in thread
* fix: ui rebuild caching issues (statuses list, notifications list, etc)
* fix: don’t crash on display notification with unknown by Fedi2 type
* fix: home timeline works as expected