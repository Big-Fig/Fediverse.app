import 'package:fedi/Pleroma/Foundation/Client.dart';

class Registration {
// registration urls
  static String register = "/api/v1/apps";
  static String authorize(Client client) {
    return "${client.baseURL}/oauth/authorize?response_type=code&redirect_uri=${client.clientSettings.redirectUri}&scope=read%20write%20follow%20push&client_id=${client.clientSettings.clientId}";
  }
  static String getAuthToken(Client client) {
    return "${client.baseURL}/oauth/token?grant_type=authorization_code&code=${client.clientSettings.code}&redirect_uri=${client.clientSettings.redirectUri}&client_id=${client.clientSettings.clientId}&client_secret=${client.clientSettings.clientSecret}&scope=read%20write%20follow%20push";
  }
}
