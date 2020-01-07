class Notification {


  static String getNotifications({ String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/notifications?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit";
  }

    static String getMentionsNotifications({ String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/notifications?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_types[]=follow&exclude_types[]=favourite&exclude_types[]=reblog&exclude_types[]=poll";
  }

   static String getActivityNotifications({ String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/notifications?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_types[]=follow&exclude_types[]=mention&exclude_types[]=poll";
  }

  static String getFollowerNotifications({ String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/notifications?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_types[]=favourite&exclude_types[]=reblog&exclude_types[]=mention&exclude_types[]=poll";
  }
  //follow,favourite,reblog,mention,poll

  static String getNotificationById(String id){
    return "/api/v1/notifications/$id";
  }

}