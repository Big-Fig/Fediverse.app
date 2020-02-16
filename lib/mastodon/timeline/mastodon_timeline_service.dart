import 'package:fedi/mastodon/status/mastodon_status_model.dart';
import 'package:flutter/widgets.dart';

abstract class IMastodonTimelineService {
  Future<List<IMastodonStatus>> getPublicTimeline({
    // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // Show only local statuses?
    bool onlyMedia = false, // Show only statuses with media attached?
    bool onlyLocal = false,
  });

  Future<List<IMastodonStatus>> getHashTagTimeline(
      {
      // for example '#cats'
      @required String hashTag, // Return results older than id
      String maxId, // Return results newer than id
      String sinceId, // Return results immediately newer than id
      String minId, // Maximum number of results to return
      int limit = 20, // Show only local statuses?
      bool onlyMedia = false, // Show only statuses with media attached?
      bool onlyLocal = false});

  Future<List<IMastodonStatus>> getHomeTimeline(
      {
      // Return results older than id
      String maxId, // Return results newer than id
      String sinceId, // Return results immediately newer than id
      String minId, // Maximum number of results to return
      int limit = 20, // Show only local statuses?
      bool onlyMedia = false});

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
