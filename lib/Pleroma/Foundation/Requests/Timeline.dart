class Timeline {
  static String getHomeTimeline(
      {String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/timelines/home?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_visibilities[]=direct";
  }
  static String getLocalTimeline(
      {String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/timelines/public?local=true&max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_visibilities[]=direct";
  }

  static String getPublicTimeline(
      {String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/timelines/public?&max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_visibilities[]=direct";
  }

  static String getPublicMediaTimeline(String maxId){
    return "/api/v1/timelines/public?only_media=true&max_id=$maxId&exclude_visibilities[]=direct";
  }

  static String getConvverstations(
      {String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/conversations?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit";
  }


}
