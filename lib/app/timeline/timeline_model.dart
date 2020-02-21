import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:flutter/widgets.dart';

enum TimelineRemoteType { public, list, home, hashtag }

abstract class ITimelineSettings {
  String get inListWithRemoteId;

  String get withHashTag;

  IAccount get homeAccount;

  bool get onlyLocal;

  bool get notMuted;

  List<PleromaVisibility> get excludeVisibilities;

  TimelineRemoteType get remoteType;

  String get localUrlHost => null;

  bool get onlyMedia => null;

  bool get noNsfwSensitive => null;

  bool get noReplies => null;
}

class TimelineSettings implements ITimelineSettings {
  final TimelineLocalPreferences localPreferences;

  @override
  final List<PleromaVisibility> excludeVisibilities;

  @override
  final bool onlyLocal;

  @override
  final bool notMuted;

  @override
  bool get noNsfwSensitive =>
      localPreferences.noNsfwSensitive;

  @override
  bool get noReplies => localPreferences.noReplies;

  @override
  bool get onlyMedia =>
      localPreferences.onlyMedia;

  @override
  final String inListWithRemoteId;

  @override
  final String localUrlHost;

  @override
  final IAccount homeAccount;


  @override
  final TimelineRemoteType remoteType;

  @override
  final String withHashTag;

  TimelineSettings._private(
      {@required this.localPreferences,
      @required this.excludeVisibilities,
      @required this.onlyLocal,
      @required this.notMuted,
      @required this.inListWithRemoteId,
      @required this.localUrlHost,
      @required this.homeAccount,
      @required this.remoteType,
      @required this.withHashTag}) {
    assert(remoteType != null);
    switch (remoteType) {
      case TimelineRemoteType.public:
        break;
      case TimelineRemoteType.list:
        assert(inListWithRemoteId != null);
        break;
      case TimelineRemoteType.home:
        assert(homeAccount != null);
        break;
      case TimelineRemoteType.hashtag:
        assert(withHashTag != null);
        break;
    }

    if (onlyLocal == true) {
      assert(localUrlHost != null);
    }

    assert(notMuted != null);
  }

  TimelineSettings.home({
    @required TimelineLocalPreferences localPreferences,
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool notMuted,
    @required String localUrlHost,
    @required IAccount homeAccount,
  }) : this._private(
            localPreferences: localPreferences,
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            notMuted: notMuted,
            localUrlHost: localUrlHost,
            homeAccount: homeAccount,
            remoteType: TimelineRemoteType.home,
            withHashTag: null,
            inListWithRemoteId: null);

  TimelineSettings.list({
    @required TimelineLocalPreferences localPreferences,
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool notMuted,
    @required String localUrlHost,
    @required String inListWithRemoteId,
  }) : this._private(
            localPreferences: localPreferences,
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            notMuted: notMuted,
            localUrlHost: localUrlHost,
            homeAccount: null,
            remoteType: TimelineRemoteType.list,
            withHashTag: null,
            inListWithRemoteId: inListWithRemoteId);

  TimelineSettings.hashTag({
    @required TimelineLocalPreferences localPreferences,
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool notMuted,
    @required String localUrlHost,
    @required String withHashTag,
  }) : this._private(
            localPreferences: localPreferences,
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            notMuted: notMuted,
            localUrlHost: localUrlHost,
            homeAccount: null,
            remoteType: TimelineRemoteType.hashtag,
            withHashTag: withHashTag,
            inListWithRemoteId: null);

  TimelineSettings.public({
    @required TimelineLocalPreferences localPreferences,
    @required List<PleromaVisibility> excludeVisibilities,
    @required bool onlyLocal,
    @required bool notMuted,
    @required String localUrlHost,

  }) : this._private(
            localPreferences: localPreferences,
            excludeVisibilities: excludeVisibilities,
            onlyLocal: onlyLocal,
            notMuted: notMuted,
            localUrlHost: localUrlHost,
            homeAccount: null,
            remoteType: TimelineRemoteType.public,
            withHashTag: null,
            inListWithRemoteId: null);
}
