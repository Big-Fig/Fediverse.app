class Chat {

  static String deleteMessage(
      {String chatID,
      String messageID}) {
    return "/api/v1/pleroma/chats/$chatID/messages/$messageID";
  }

  static String getChats ({String maxId,
      String sinceId,
      String minId,
      String limit}) {
    limit = limit ?? "20";
    maxId = maxId ?? "";
    sinceId = sinceId ?? "";
    minId = minId ?? "";
    return "/api/v1/pleroma/chats?max_id=$maxId&since_id=$sinceId&min_id=$minId&limit=$limit";
  }

  static String getChatMessages(String chatID){
    return "/api/v1/pleroma/chats/$chatID/messages";
  }

  static String postMessage(String chatID){
    return "/api/v1/pleroma/chats/$chatID/messages";
  }

  static String createChatByAccount(String accountID){
    return "/api/v1/pleroma/chats/by-account-id/$accountID";
  }

  static String getChatByID(String chatID){
    return "/api/v1/pleroma/chats/R$chatID";
  }

}