import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:flutter/widgets.dart';

enum TimelineRemoteType { public, list, home, hashtag }

abstract class ITimelineSettings {
  String get onlyInListWithRemoteId;

  String get withHashtag;

  IAccount get homeAccount;

  bool get onlyLocal;

  bool get onlyNotMuted;

  List<PleromaVisibility> get excludeVisibilities;

  TimelineRemoteType get remoteType;
}

class TimelineSettings implements ITimelineSettings {
  @override
  final List<PleromaVisibility> excludeVisibilities;

  @override
  final bool onlyLocal;

  @override
  final bool onlyNotMuted;

  @override
  final String onlyInListWithRemoteId;

  @override
  final IAccount homeAccount;

  @override
  final TimelineRemoteType remoteType;

  @override
  final String withHashtag;

  TimelineSettings._private(
      {@required this.excludeVisibilities,
      @required this.onlyLocal,
      @required this.onlyNotMuted,
      @required this.onlyInListWithRemoteId,
      @required this.homeAccount,
      @required this.remoteType,
      @required this.withHashtag}) {
    assert(remoteType != null);
    switch (remoteType) {
      case TimelineRemoteType.public:
        break;
      case TimelineRemoteType.list:
        assert(onlyInListWithRemoteId != null);
        break;
      case TimelineRemoteType.home:
        assert(homeAccount != null);
        break;
      case TimelineRemoteType.hashtag:
        assert(withHashtag != null);
        break;
    }

    assert(onlyNotMuted != null);
  }

  TimelineSettings.home({
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool onlyNotMuted,
    @required IAccount homeAccount,
  }) : this._private(
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            onlyNotMuted: onlyNotMuted,
            homeAccount: homeAccount,
            remoteType: TimelineRemoteType.home,
            withHashtag: null,
            onlyInListWithRemoteId: null);

  TimelineSettings.list({
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool onlyNotMuted,
    @required String onlyInListWithRemoteId,
  }) : this._private(
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            onlyNotMuted: onlyNotMuted,
            homeAccount: null,
            remoteType: TimelineRemoteType.list,
            withHashtag: null,
            onlyInListWithRemoteId: onlyInListWithRemoteId);

  TimelineSettings.hashtag({
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool onlyNotMuted,
    @required String withHashtag,
  }) : this._private(
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            onlyNotMuted: onlyNotMuted,
            homeAccount: null,
            remoteType: TimelineRemoteType.hashtag,
            withHashtag: withHashtag,
            onlyInListWithRemoteId: null);

  TimelineSettings.public({
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool onlyNotMuted,
  }) : this._private(
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            onlyNotMuted: onlyNotMuted,
            homeAccount: null,
            remoteType: TimelineRemoteType.public,
            withHashtag: null,
            onlyInListWithRemoteId: null);

  @override
  String toString() {
    return 'TimelineSettings{'
        ' excludeVisibilities: $excludeVisibilities,'
        ' onlyLocal: $onlyLocal, onlyNotMuted: $onlyNotMuted,'
        ' onlyInListWithRemoteId: $onlyInListWithRemoteId,'
        ' homeAccount: $homeAccount,'
        ' remoteType: $remoteType, withHashtag: $withHashtag}';
  }
}
