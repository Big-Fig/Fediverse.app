

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

  static String followers(String id){
    return "/api/v1/accounts/$id/followers";
  }

}

