import 'dart:async';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';


import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

import '../Pleroma/Models/AccountAuth.dart';

class DeepLinkHelper {

  static DeepLinkHelper of(BuildContext context, {listen: true}) =>
      Provider.of(context, listen: listen);
  
  bool isLoading = false;
  Function() instanceSuccess;

  Future<Null> initUniLinks() async {

    if (  isLoading == true){
      return;
    }

    isLoading = true;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Uri initialUri = await getInitialUri();
      // Use the uri and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      if (initialUri != null) {
        print("LINK DATA");
        print(initialUri.host);
        print(initialUri);
        print("All done with link data");
        if (initialUri.host == "addnewinstance") {
          loadNewInstance(initialUri);
        }
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  loadNewInstance(Uri uri) {
    if (uri.queryParameters['code'] == null) {
      return;
    }

    String code = uri.queryParameters['code'].toString();

    InstanceStorage.getNewInstanceClient().then((client) {
      CurrentInstance.newInstance.currentClient = client;
      CurrentInstance.newInstance.currentClient.clientSettings.code = code;
      CurrentInstance.newInstance.currentClient
          .getAuthToken()
          .then((authResponse) {
        print(authResponse.body);
        var newAuth = AccountAuth.fromJsonString(authResponse.body);
        CurrentInstance.newInstance.currentAuth = newAuth;
        CurrentInstance.newInstance.currentClient.accessToken =
            newAuth.accessToken;
        instanceSuccess();
      });
    });
  }

  loadNewInstancebycode(String code){


    InstanceStorage.getNewInstanceClient().then((client) {
      CurrentInstance.newInstance.currentClient = client;
      CurrentInstance.newInstance.currentClient.clientSettings.code = code;
      CurrentInstance.newInstance.currentClient
          .getAuthToken()
          .then((authResponse) {
        print(authResponse.body);
        var newAuth = AccountAuth.fromJsonString(authResponse.body);
        CurrentInstance.newInstance.currentAuth = newAuth;
        CurrentInstance.newInstance.currentClient.accessToken =
            newAuth.accessToken;
        instanceSuccess();
      });
    });
  }
}
