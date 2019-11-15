import 'dart:async';
import 'dart:io';

import 'package:phaze/Pleroma/Foundation/InstanceStorage.dart';

import '../Pleroma/Models/AccountAuth.dart' as Auth;

import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class DeepLinkHelper {

  bool isLoading = false;
  Function() instanceSuccess;

  DeepLinkHelper._privateConstructor();

  static final DeepLinkHelper _instance = DeepLinkHelper._privateConstructor();
  static DeepLinkHelper get instance {
    return _instance;
  }

  static Future<Null> initUniLinks() async {

    if (DeepLinkHelper.instance.isLoading == true){
      return;
    }

    DeepLinkHelper.instance.isLoading = true;
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
          DeepLinkHelper.loadNewInstance(initialUri);
        }
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  static loadNewInstance(Uri uri) {
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
        var newAuth = Auth.accountAuthFromJson(authResponse.body);
        CurrentInstance.newInstance.currentAuth = newAuth;
        CurrentInstance.newInstance.currentClient.accessToken =
            newAuth.accessToken;
        DeepLinkHelper.instance.instanceSuccess();
      });
    });
  }

  static loadNewInstancebycode(String code){


    InstanceStorage.getNewInstanceClient().then((client) {
      CurrentInstance.newInstance.currentClient = client;
      CurrentInstance.newInstance.currentClient.clientSettings.code = code;
      CurrentInstance.newInstance.currentClient
          .getAuthToken()
          .then((authResponse) {
        print(authResponse.body);
        var newAuth = Auth.accountAuthFromJson(authResponse.body);
        CurrentInstance.newInstance.currentAuth = newAuth;
        CurrentInstance.newInstance.currentClient.accessToken =
            newAuth.accessToken;
        DeepLinkHelper.instance.instanceSuccess();
      });
    });
  }
}
