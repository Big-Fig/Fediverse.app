class Status {
  static String postNewStatus = "/api/v1/statuses";

  static String getStatusContext(String id){
    return "/api/v1/statuses/$id/context";
  }

   static String favouriteStatus(String id){
    return "/api/v1/statuses/$id/favourite";
  }

   static String unfavouriteStatus(String id){
    return "/api/v1/statuses/$id/unfavourite";
  }

   static String reblogStatus(String id){
    return "/api/v1/statuses/$id/reblog";
  }

  static String unreblogStatus(String id){
    return "/api/v1/statuses/$id/reblog";
  }

}
