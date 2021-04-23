abstract class IBaseMastodonFilter {
  ///  The text to be filtered.
  String get phrase;

  ///  The contexts in which the filter should be applied.
  List<String> get context;

  List<MastodonFilterContextType> get contextMastodonType;

  /// Should matching entities in home and notifications be dropped by the server?
  bool get irreversible;

  /// Should the filter consider word boundaries?
  bool get wholeWord;
}

abstract class IMastodonFilter implements IBaseMastodonFilter {
  /// The ID of the filter in the database.
  String get id;

  /// When the filter should no longer be applied
  DateTime? get expiresAt;
}

abstract class IPostMastodonFilter implements IBaseMastodonFilter {
  /// When the filter should no longer be applied
  int? get expiresInSeconds;
}

extension MastodonFilterContextTypeStringListExtension on List<String> {
  List<MastodonFilterContextType> toMastodonFilterContextTypes() {
    return map(
      (value) => value.toMastodonFilterContextType(),
    ).toList();
  }
}

enum MastodonFilterContextType {
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

const unknownMastodonFilterContextType = MastodonFilterContextType.unknown;

const _homeSetMastodonFilterContextTypeValue = "home";
const _notificationsSetMastodonFilterContextTypeValue = "notifications";
const _publicSetMastodonFilterContextTypeValue = "public";
const _threadSetMastodonFilterContextTypeValue = "thread";
const _accountSetMastodonFilterContextTypeValue = "account";
const _unknownSetMastodonFilterContextTypeValue = "unknown";

extension MastodonFilterContextTypeJsonValueExtension
    on MastodonFilterContextType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonFilterContextType.homeAndCustomLists:
        result = _homeSetMastodonFilterContextTypeValue;
        break;
      case MastodonFilterContextType.account:
        result = _accountSetMastodonFilterContextTypeValue;
        break;
      case MastodonFilterContextType.public:
        result = _publicSetMastodonFilterContextTypeValue;
        break;
      case MastodonFilterContextType.notifications:
        result = _notificationsSetMastodonFilterContextTypeValue;
        break;
      case MastodonFilterContextType.thread:
        result = _threadSetMastodonFilterContextTypeValue;
        break;
      case MastodonFilterContextType.unknown:
        result = _unknownSetMastodonFilterContextTypeValue;
        break;
    }

    return result;
  }
}

extension MastodonFilterContextTypeStringExtension on String {
  MastodonFilterContextType toMastodonFilterContextType() {
    MastodonFilterContextType result;

    switch (this) {
      case _homeSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.homeAndCustomLists;
        break;
      case _threadSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.thread;
        break;
      case _notificationsSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.notifications;
        break;
      case _publicSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.public;
        break;
      case _accountSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.account;
        break;
      case _unknownSetMastodonFilterContextTypeValue:
        result = MastodonFilterContextType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownMastodonFilterContextType;
        break;
    }

    return result;
  }
}
