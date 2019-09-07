class Status {
  static String postNewStatus = "/api/v1/statuses";

  static String getStatusContext(String id){
    return "/api/v1/statuses/$id/context";
  }

}
