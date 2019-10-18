class Notification {


  static String getNotifications({ String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/notifications?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit";
  }

  static String getNotificationById(String id){
    return "/api/v1/notifications/$id";
  }

}