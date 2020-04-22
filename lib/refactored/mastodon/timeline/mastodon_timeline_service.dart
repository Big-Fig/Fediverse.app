import 'package:fedi/refactored/mastodon/status/mastodon_status_model.dart';
import 'package:flutter/widgets.dart';

abstract class IMastodonTimelineService {
  Future<List<IMastodonStatus>> getPublicTimeline({
    // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // Show only local statuses?
    bool onlyWithMedia = false, // Show only statuses with media attached?
    bool onlyLocal = false,
  });

  Future<List<IMastodonStatus>> getHashtagTimeline(
      {
      // for example '#cats'
      @required String hashtag, // Return results older than id
      String maxId, // Return results newer than id
      String sinceId, // Return results immediately newer than id
      String minId, // Maximum number of results to return
      int limit = 20, // Show only local statuses?
      bool onlyWithMedia = false, // Show only statuses with media attached?
      bool onlyLocal = false});

  Future<List<IMastodonStatus>> getHomeTimeline(
      {
      // Return results older than id
      String maxId, // Return results newer than id
      String sinceId, // Return results immediately newer than id
      String minId, // Maximum number of results to return
      int limit = 20, // Show only local statuses?
      bool onlyWithMedia = false});

  Future<List<IMastodonStatus>> getListTimeline({
    // list id
    @required String listId,

    // Return results older than id
    String maxId,

    // Return results newer than id
    String sinceId,

    // Return results immediately newer than id
    String minId,

    // Maximum number of results to return
    int limit = 20,
  });
}
