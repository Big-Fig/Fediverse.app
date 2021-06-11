# 2.3.0(beta) 2021 June 6

* handle incoming share events
* hashtag timeline page for remote instances
* public timeline for remote instances
* settings support for remote instance timelines

# 2.2.0(beta) 2021 May 30

* featured tags
* endorsements
* instance activity
* trends
* instance directory

# 2.1.2(stable)

* hotfixes to make stable release from 2.0.54

# 2.0.54(beta) 2021 May 15

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
 
# 2.0.53(beta) 2021 May 10

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
* Use fedi instead material indicator in positioned list on Thread screen
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

# 2.0.52(beta) 2021 May 2

* a lot of new unit-tests + minor bugfixes for issues found by new test

# 2.0.51(beta) 2021 April 18

* improved websockets logic. Better performance + less battery usage
* bug fixes

# 2.0.49(beta) 2021 April 13

* local database logic refactoring and optimization

# 2.0.47(beta) 2021 April 3

* design update for chats, muting, media selection, dialogs and much more
* updated to Flutter 2.0. All libraries was updated to never versions. 
Everything looks fine but new libraries versions may cause unexpected bugs so any feedback will be welcome. 
I will additionally test app during 1-2 week before releasing this version to public
* source code was refactored to support null-safety. During this process was found and fixed several minor bugs


# 2.0.46(beta) 2021 March 13

* design update for chats, muting, media selection, dialogs and much more
* updated to Flutter 2.0. All libraries was updated to never versions. 
Everything looks fine but new libraries versions may cause unexpected bugs so any feedback will be welcome. 
I will additionally test app during 1-2 week before releasing this version to public
* source code was refactored to support null-safety. During this process was found and fixed several minor bugs

# 2.0.45(beta) 2021 March 7

* fix chats fetching. Chats don’t support pagination yet but Fedi sent it by default. In latest update fedi.app start return error for chats endpoint if it has pagination arguments. So I removed pagination args until pagination will be implemented
* fix slow scroll in Thread Page to initial status
* improved input text fields UX: remove keyboard focus/unfocus blinking when user taps on input field to move cursor or select text
* switch UX
* show followRequestCount badge when followRequest notification arrives
* better click on hashtag UX: ask user if hashtag on remote instance. Open in browser on remote instance or open in app on local instance.
* support chat message selection for failed messages
* fix rare crashes on Android when downloading media


# 2.0.44(beta) 2021 February 27

* auto-reload images when connection restored
* fix text overflow bug in chat previews
* add confirm dialog for delete chat/conversation
* enabled expire_in support for filters on Pleroma
* improve select many from list dialog UX

# 2.0.43(beta) 2021 February 14

* add media picker current selection UI
* fix appName during register app on instance
* improve chat/conversations UI/UX. Don’t block UI during sending message. It is possible to re-send failed message
* a lot of minor UX fixes


# 2.0.42(beta) 2021 February 8

* expire_in support for publish statuses
* timed account mute + mute UI rework
* badge when user have active follow request
* delete & re-post/re-draft actions + rework delete UI
* more options to timeline filters: replyVisibility, excludeVisibilities, onlyFromInstance
* minor bugfix, localization fixes + more unit tests

# 2.0.40(beta) 2021 January 31

* chat & conversations long tap to select messages and actions: share, copy, delete
* delete conversation
* add support for pleroma only visibilities: local & list
* add idempotencyKey support to post status & post chat message
* fix media attachments display: use reblog media attachment if reblog exist
* add selected chat message option: share. Improve share status logic
* create poll UX

# 2.0.39(beta) 2021 January 27

* hotfixes & UI/UX improvements for 2.0.38 related to remote instance data fetching

# 2.0.38(beta) 2021 January 26

* Instance information Page with full instance details from /api/v1/instance endpoint
* Load account and statuses(and threads) via public API from remote (origin) instances
* fixed several minor bugs

# 2.0.36(beta) 2021 January 18

* better error messages
* subscribe on specific account statuses (pleroma only)
* registration rework and improvements: add reason  language field. Handle approvalRequired & confirmationEmailSent cases
* add favourites tab in account details page (pleroma only for non-own accounts).
* multi-selection support for media files
* fixed account add/remove to List.
* handle in UI hide follower/followings/favourites account fields
* fixed account Note edit on Mastodon
* fixed Only Fun integration: chat issues

# 2.0.35(beta) 2021 January 4

* database & files cache limits options

# 2.0.34(beta) 2020 December 22

* apply filter when fetch data from local cache
* more settings options
* delete all cached data on logout
* a lot of minor bugfixes

# 2.0.33(beta) 2020 December 14

* ask for review popup (will work only in Fedi1 release builds loaded from AppStore/GooglePlay)
* share improvements: account selection rework & add recent feature, share status UI improvements
* better auth token revoked handling
* account muting options
* filters support. API wrapper implemented, but local filtering for already cached statuses not ready yet

# 2.0.32(beta) 2020 December 8

* custom list edit/create UI rework
* notifications list UI improvements
* bookmarked/favourites posts UI rework
* scheduled/draft posts UI rework
* account blocks/mutes, domain blocks UI rework
* follow request UI rework

# 2.0.31(beta) 2020 December 1

* in-app notifications feature
* a lot of minor UI/UX improvements
* fix ios 14 non-safari default browser bug
* more settings options

# 2.0.30(beta) 2020 November 23

* forms refactoring & improvements: disabled state support
* settings rework: support custom per-instance settings and global settings storage

# 2.0.29(beta) 2020 November 17

* settings rework
* timelines managing improvements
* minor UI improvements
* pleroma EmojiReaction notification settings
* localization support. I added Russian support to test it.

# 2.0.28(stable) 2020 November 8

* fix android push notifications
* global localization improvements
* global UI performance improvements
* DMs conversations now looks like chats. I decided to not remove it, because AppStore/Google play users leave feedback about that feature
* icons update
* a lot of UI/UX minor improvements
* better mastodon support

# 2.0.27(beta) 2020 October 26

* slack-like input related
* text wrapping in input at timeline
* better dark theme colors
* adaptive dark theme colors (use system brightness)
* fix emoji picker async init loading
* fix emoji picker recent category
* switching account UI localisation improvements
* additional logic to handle login in chromium based browsers on Android
* additional dialogs to ask notification permission on start & describe notification proxy & error alert dialog

# 2.0.26(beta) 2020 October 19

* dark theme support (design update not ready yet, so I just modified architecture to support themes and inverted colors)
* slack-like thread input (design update not ready yet, so I adopted slack implementation).
* performance improvements
* better notification messages
* better error handling

# 2.0.25(beta) 2020 October 12

* share rework (design & refactoring)
* video/audio player rework (design & refactoring)
* nsfw/spoiler blur & labels UI rework
* poll vote rework (design & refactoring)
* poll create/edit rework (design & refactoring)
* fix minor bugs

# 2.0.24(beta) 2020 October 5

* automatically append own posts to timeline
* fix timeline tab indicator invalid color bug
* add more details to login process to handle what going wrong
* possible fixes for blue screen stuck & always instance dead error
* don't display zero counters
* fix timeline rebuild after settings changes
* update crash handling library
* improve timelines performance: don't update data for timelines too often

# 2.0.23(beta) 2020 September 28

* custom timelines managing (add, remove, sort)

# 2.0.22(stable) 2020 September 22

* update flutter framework libraries & all libraries. Should increase performance, but may cause unexpected bugs. Update was required due to conflicts between new libraries and old
* icon for bot accounts
* separate settings for each timeline. Remove unsupported filter options for some timelines
* special 'request_follow' button for locked accounts
* fix notifications for mastodon.instances (related to https support on push relay server)
* a lot of new unit tests for better stability

# 2.0.21(beta) 2020 September 13

* account mutes, blocks, domain blocks feature
* status conversation mute action
* auto-add new notifications after notification tab switching. However, new logic forces scroll position to top after tab switching, so we loose old scroll state.
* sometimes stuck when click on notification (when notification from non-active instance).
* add timeout to all REST request to avoid freeze on poor connection
* dismiss single notification feature
* add android notifications channels
* Account settings: default visibility, always display spoilers, always display nsfw, mark media nsfw by default
* fix invalid font size for statuses when OS accessibility font size changed
* Faster push notifications (changes on PushRelay Ruby proxy-server): unsubscribe from webpush notifications when target FCM device id already expired
* fix broken chat input field UI

# 2.0.20(beta) 2020 September 7

* implemented flavors. Flavor will save time on creating feature builds. From now Fedi2(dev) and Fedi1(prod) will have different icons and title.
* add light grey background for focused status in thread. Display status actions only for focused status and first status in thread.
* add multi-select account UI (used for mentions, lists, etc)
* hashtag and lists real-time websockets update
* handle instance config registration limits (approval required, invites only)
* handle instance config account fields limits
* handle instance config post status & create poll limits
* remove html tags from sharing raw status text to external apps
* add custom (per-account) pleroma background image account field support (display on home page & edit)
* better upload media error details in notification
* better refresh & load more error details in notification
* accept/reject follow request.
* handle follow requested in account details page
* dynamically increase timeago UI (without manual statuses refresh)
* dynamically expire poll (without manual refresh)

# 2.0.19(beta) 2020 August 31

* bookmark/unBookmark statuses
* lists create/edit/add account/remove account/ and fetch statuses support. Access from Account Settings Page. Design not very well, I will improve in next release, please leave feedback if you have any suggestions
* hashtags support: add in search, fetch statuses, handle click in status
* bookmarks and favourites statuses fetch support. Access from Account Settings Page
* delete status feature & handle delete status by other people websockets event
* fix bug: don’t search for old DM with same user during start conversation
* better start conversation input UI: added autofocus for input field
* added slider between attachments in media attachments details page
* fix non-media attachments type & filename handling when description is empty
* fix search results ALL tab: group separators are valid now
* added status bottom actions bar in status thread for replies. It is temporary solution. I will implement actions only for focused reply in the future to avoid too much UI elements on the screen

# 2.0.18(beta) 2020 August 24

* pin/unpin statuses support
* add statuses tabs (only media, with replies, without replies, pinned) to account page
* add edit status UI (for draft and scheduled posts)
* add drafts statuses feature
* add open account in browser dialog action to open account on home instance
* add “Subject” field in to post new status UI
* new nsfw action icon
* nsfw spoiler alert description update
* minor performance changes

# 2.0.17(beta) 2020 August 16

* Better share. Share to Chats, DMs. Better external share.
* add captcha support
* add captcha to registration if it is supported by server.
* add create poll UI
* better UI for images with transparent background
* fix bug “can’t reply to DIRECT message in thread”
* fix video player crash for mp4 files without actual video track (audio only)
* fix a lot of minor issues from non-fatal issues reports gathered via Firebase.


# 2.0.16(beta) 2020 August 6

* add x86_64 and arm64 architecture support. Previously app not worked on it
* fix several minor bugs from Firebase crash reports.

# 2.0.15(beta) 2020 August 5

* poll view and vote support
* custom emoji picker support
* emoji picker UI rework
* navigation to status/chat/account after click on notification
* dialogs UI improvements
* nsfw/spoiler alert UI rework. Fix double “tap to view” when status contains both nsfw and spoiler
* improve chat last message local storage performance.
* rework drawers UI. Turn them in subpages
* remove grey divider just before status actions

# 2.0.13(stable) 2020 July 28

* fix form links bug
* add safe area wrappers for all pages to fix layout issues on iphone X

# 2.0.12(beta) 2020 July 26

* ToS UI improvements
* search tabs UI fix
* toggle emoji reaction fix
* better date picker UI
* highlight mentions in edit text field
* fix notification and timeline tabs unread badges
* handle session expired error response from pleroma
* better emoji picker popup dialog
* fix image caching in Media Details Page
* start chat/conversation fix

# 2.0.10(beta) 2020 July 21

* html support in account note field
* splash UI
* all dialogs UI
* no network mode improvements
* refactoring
* account message action implementation
* tabs fading instead of clipping
* account fields new UI
* new search UI
* new date picker UI
* increase nsfw clickable area
* status thread reply input label
* fix tabs border radius
* new heart icon
* a lot of other minor fixeS

# 2.0.9(beta) 2020 July 12

* performance improvements

# 2.0.8(beta) 2020 July 3

* fix firefox login on android & fix chats is grey on iOS
* fix dismiss keyboard on login
* improve reply and chat input UI.
* forms improvements: UI & validation. (account edit & registration)
* refresh instance features on app start instead of one-time caching on login
* add video picking support
* fix post status/chat message with not-uploaded media
* failed UI & reupload for media attachments
* tap to load support on account page
* improve search UI
* remove autocorrect on host edit text
* fix status bar color switching
* add horizontal scroll for tabs for small screens

# 2.0.7(beta) 2020 June 28

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

# 2.0.6(beta) 2020 June 16

* fix “This instance don’t support chats yet” checking

# 2.0.5(beta) 2020 June 15

* fix firefox login on android.
* better account relationship logic
* fix scrolling issues on some iOS devices
* better search
* unknown attached file type support
* better chat not implemented error
* hide keyboard on scroll

# 2.0.4(beta) 2020 June 14

* Chat API fixes
* all app bars on home page not docked
* better status/account throttling
* fix reblogged status actions
* account followers/following page
* bottom nav bar clickable area
* media attachment not enough space fix
* better media preview UI (audio, video carousel)
* emoji support everywhere & overflow (account user name and display name)
* don’t allow sign-in with already signed credentials
* improve splash UI
* better “Tap to load” and unread badges
* a lot of other minor UI improvements and bug fixes

# 2.0.3(beta) 2020 June 5

* fix login on android with non-chrome browser. This is huge improvement, because login was broken even if user just installed second browser in addition to chrome
* new Chat API improvements. Everything should work now
* registration fixes
* fix timelines scrolling issue on iOS
* a lot of minor UI fixes

# 2.0.2(beta) 2020 June 2

* new chats api improvements
* timelines scrolling handling (floating & pinned UI elements).
* status thread improvements
* reply/reblog improvements
* unread badges improvements
* a lot of other minor fixes & improvements

# 2.0.1(beta) 2020 May 28

* header background fetching from backend
* fully existing chats API support (with realtime updates via push API and background updates via push notifications)
* better chats list - accounts loaded immediately
* fix notification icon on android
* new Chat design
* new Search design
* Fix select account to start chat
* fix: jump to original status in thread
* fix: ui rebuild caching issues (statuses list, notifications list, etc)
* fix: don’t crash on display notification with unknown by Fedi2 type
* fix: home timeline works as expected
* all old UI screens use new UI elements
* couple of other minor fixes