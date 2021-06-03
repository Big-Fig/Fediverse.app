abstract class IBaseMastodonApiFilter {
  ///  The text to be filtered.
  String get phrase;

  ///  The contexts in which the filter should be applied.
  List<String> get context;

  List<MastodonApiFilterContextType> get contextAsMastodonApiType;

  /// Should matching entities in home and notifications be dropped by the server?
  bool get irreversible;

  /// Should the filter consider word boundaries?
  bool get wholeWord;
}

abstract class IMastodonApiFilter implements IBaseMastodonApiFilter {
  /// The ID of the filter in the database.
  String get id;

  /// When the filter should no longer be applied
  DateTime? get expiresAt;
}

abstract class IPostMastodonApiFilter implements IBaseMastodonApiFilter {
  /// When the filter should no longer be applied
  int? get expiresInSeconds;
}

extension MastodonApiFilterContextTypeStringListExtension on List<String> {
  List<MastodonApiFilterContextType> toMastodonApiFilterContextTypes() {
    return map(
      (value) => value.toMastodonApiFilterContextType(),
    ).toList();
  }
}

enum MastodonApiFilterContextType {
  /// home timeline and lists
  homeAndCustomLists,

  /// notifications timeline
  notifications,

  /// public timelines
  public,

  /// expanded thread of a detailed status
  thread,

  /// account page
  account,

  /// new type which not recognized by Fedi yet
  unknown,
}

const unknownMastodonApiFilterContextType = MastodonApiFilterContextType.unknown;

const _homeSetMastodonApiFilterContextTypeValue = "home";
const _notificationsSetMastodonApiFilterContextTypeValue = "notifications";
const _publicSetMastodonApiFilterContextTypeValue = "public";
const _threadSetMastodonApiFilterContextTypeValue = "thread";
const _accountSetMastodonApiFilterContextTypeValue = "account";
const _unknownSetMastodonApiFilterContextTypeValue = "unknown";

extension MastodonApiFilterContextTypeJsonValueExtension
    on MastodonApiFilterContextType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiFilterContextType.homeAndCustomLists:
        result = _homeSetMastodonApiFilterContextTypeValue;
        break;
      case MastodonApiFilterContextType.account:
        result = _accountSetMastodonApiFilterContextTypeValue;
        break;
      case MastodonApiFilterContextType.public:
        result = _publicSetMastodonApiFilterContextTypeValue;
        break;
      case MastodonApiFilterContextType.notifications:
        result = _notificationsSetMastodonApiFilterContextTypeValue;
        break;
      case MastodonApiFilterContextType.thread:
        result = _threadSetMastodonApiFilterContextTypeValue;
        break;
      case MastodonApiFilterContextType.unknown:
        result = _unknownSetMastodonApiFilterContextTypeValue;
        break;
    }

    return result;
  }
}

extension MastodonApiFilterContextTypeStringExtension on String {
  MastodonApiFilterContextType toMastodonApiFilterContextType() {
    MastodonApiFilterContextType result;

    switch (this) {
      case _homeSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.homeAndCustomLists;
        break;
      case _threadSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.thread;
        break;
      case _notificationsSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.notifications;
        break;
      case _publicSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.public;
        break;
      case _accountSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.account;
        break;
      case _unknownSetMastodonApiFilterContextTypeValue:
        result = MastodonApiFilterContextType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownMastodonApiFilterContextType;
        break;
    }

    return result;
  }
}
