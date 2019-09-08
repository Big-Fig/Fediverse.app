

class Accounts {

  static String account({String id}) {
    return "/api/v1/account/$id";
  }

  static String currentUser() {
      return "/api/v1/accounts/verify_credentials";
  }

  static String updateCurrentUser(){
    return "/api/v1/accounts/update_credentials";
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

}

