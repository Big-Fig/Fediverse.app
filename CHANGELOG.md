# 2.3.0 (beta) 2021 June 6

### Added
* handle incoming share events
* hashtag timeline page for remote instances
* public timeline for remote instances
* settings support for remote instance timelines

# 2.2.0 (beta) 2021 May 30

### Added
* featured tags
* endorsements
* instance activity
* trends
* instance directory

# 2.1.2 (stable)

### Added

# 2.0.54 (beta) 2021 May 15

* better ‘onlyFromInstance’ timeline filter performance
* improve starting new chat UX
* improve deleting API wrappers. Don’t throw exception if record not found
* mark notification as read if user opened app by clicking on it
* handle localization settings for datetime picker
* better performance for dynamic calculating newly arrived items
* fix too long ru & en localizations
* add pagination to chats (use v2 API)
* listen filters changes and dynamically apply them without refresh currently visible screen
* minor bugfixes and performance improvements
* add more lint rules for better code quality (edited)
 
# 2.0.53 (beta) 2021 May 10

* multi select dialog UX
* fix deleting scheduled status
* fix non-media item widget
* improve clicking on mention. Don’t load from remote if exist in local cache
* better card widget for content with html tags.
* better share: exclude html tags from status sharing
* fix chat message layout: media padding and text align
* improve share media/chat selection/status as new status
* add media attachment reupload service: improve share media and status with single media
* Fix ‘unable to attach media’ on timelines screen.
* fix warnings for fedi list smart refresher refresh indicator
* add show/hide animation to merge new items button overlay for lists
* improve fedi circular progress indicator for lists. 
Use fedi instead material indicator in positioned list on Thread screen
* re*sort with_new_items dynamically. Applied for chat/conversation lists
* improve post status start conversation. Move send action to appbar
* improve start conversation on pleroma: add hack for conversation websockets event when conversation accounts is empty
* Fix deleting single conversation
* fix with_new_items: don’t duplicate own posts
* improve list refresh indicator size
* remove junks (use compute) in with_new_items lists
* improve move notification handling
* parse json from rest api in async compute
* remove warnings in fedi_list_smart_refresher_refresh_indicator.dart
* fix loading progress indicator size for images in Html widget
* improve switch: use library instead own implementation. Animation added
* rework smart refresher: Refresh indicator
* add hideTotals support in poll API
* libraries update

# 2.0.52 (beta) 2021 May 2

* a lot of new unit-tests + minor bugfixes for issues found by new test

# 2.0.51 (beta) 2021 April 18

* improved websockets logic. Better performance + less battery usage
* bug fixes

# 2.0.49 (beta) 2021 April 13

* local database logic refactoring and optimization

# 2.0.47 (beta) 2021 April 3

* design update for chats, muting, media selection, dialogs and much more
* updated to Flutter 2.0. All libraries was updated to never versions. 
Everything looks fine but new libraries versions may cause unexpected bugs so any feedback will be welcome. 
I will additionally test app during 1-2 week before releasing this version to public
* source code was refactored to support null-safety. During this process was found and fixed several minor bugs


# 2.0.46 (beta) 2021 March 13

* design update for chats, muting, media selection, dialogs and much more
* updated to Flutter 2.0. All libraries was updated to never versions. 
Everything looks fine but new libraries versions may cause unexpected bugs so any feedback will be welcome. 
I will additionally test app during 1-2 week before releasing this version to public
* source code was refactored to support null-safety. During this process was found and fixed several minor bugs

# 2.0.45 (beta) 2021 March 7

* fix chats fetching. Chats don’t support pagination yet but Fedi sent it by default. In latest update fedi.app start return error for chats endpoint if it has pagination arguments. So I removed pagination args until pagination will be implemented
* fix slow scroll in Thread Page to initial status
* improved input text fields UX: remove keyboard focus/unfocus blinking when user taps on input field to move cursor or select text
* switch UX
* show followRequestCount badge when followRequest notification arrives
* better click on hashtag UX: ask user if hashtag on remote instance. Open in browser on remote instance or open in app on local instance.
* support chat message selection for failed messages
* fix rare crashes on Android when downloading media


# 2.0.44 (beta) 2021 February 27

* auto-reload images when connection restored
* fix text overflow bug in chat previews
* add confirm dialog for delete chat/conversation
* enabled expire_in support for filters on Pleroma
* improve select many from list dialog UX

# 2.0.43 (beta) 2021 February 14

* add media picker current selection UI
* fix appName during register app on instance
* improve chat/conversations UI/UX. Don’t block UI during sending message. It is possible to re-send failed message
* a lot of minor UX fixes