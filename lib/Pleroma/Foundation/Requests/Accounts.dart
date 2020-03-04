

class Accounts {

  static String account({String id}) {
    return "/api/v1/accounts/$id";
  }

  static String getRelationshipById(String id){
    return "/api/v1/accounts/relationships?id=$id";
  }

  static String followAccoutn(String id){
    return "/api/v1/accounts/$id/follow";
  }

  static String unfollowAccoutn(String id){
    return "/api/v1/accounts/$id/unfollow";
  }

  static String currentUser() {
      return "/api/v1/accounts/verify_credentials";
  }


  static String getFollowers(String id){
    return "/api/v1/accounts/$id/followers";
  }

  static String getFollowing(String id){
    return "/api/v1/accounts/$id/following";
  }

  static String search(String q){
    return "/api/v1/accounts/search?q=$q";
  }

  static String blockAccount(String id){
    return "/api/v1/accounts/$id/block";
  }

  static String unblockAccount(String id){
    return "/api/v1/accounts/$id/unblock";
  }

  static String muteAccount(String id){
    return "/api/v1/accounts/$id/mute";
  }

  static String unmuteAccount(String id){
    return "/api/v1/accounts/$id/unmute";
  }

  static String followAccount(String id){
    return "/api/v1/accounts/$id/follow";
  }

  static String unfollowAccount(String id){
    return "/api/v1/accounts/$id/unfollow";
  }

  static String reportAccount(){
    return "/api/v1/reports";
  }

  static String getAccountStatuses({String userId, String maxId, String sinceId, String minId, String limit}) {
    limit = limit == null ? "20" : limit;
    maxId = maxId == null ? "" : maxId;
    sinceId = sinceId == null ? "" : sinceId;
    minId = minId == null ? "" : minId;
    return "/api/v1/accounts/$userId/statuses?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit&exclude_visibilities[]=direct";
  }

  static String register(){
    return "/api/v1/accounts";
  }



}

