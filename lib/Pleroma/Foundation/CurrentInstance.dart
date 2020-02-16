import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:flutter/material.dart';

import './Client.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import '../Models/AccountAuth.dart';
import 'Requests/Accounts.dart';


class CurrentInstance {
  CurrentInstance._privateConstructor();

  static final CurrentInstance _instance =
      CurrentInstance._privateConstructor();
  static CurrentInstance get instance {
    return _instance;
  }

  static final CurrentInstance _newInstance =
      CurrentInstance._privateConstructor();
  static CurrentInstance get newInstance {
    return _newInstance;
  }

  Client currentClient;
  PleromaAccount currentAccount;
  AccountAuth currentAuth;

  bool loading = false;

  setInstanceFromNewInstance() {
    CurrentInstance.instance.currentClient =
        CurrentInstance.newInstance.currentClient;
    CurrentInstance.instance.currentAccount =
        CurrentInstance.newInstance.currentAccount;
    CurrentInstance.instance.currentAuth =
        CurrentInstance.newInstance.currentAuth;
  }


  getAccountStoreNewInstance(BuildContext context, Function loadComplete, Function loadError) {

    if (loading){
      return;
    }
    CurrentInstance.newInstance.loading = true;
    CurrentInstance.newInstance.currentClient
        .run(path: Accounts.currentUser(), method: HTTPMethod.GET)
        .then((resonse) {
      PleromaAccount currentAccount = PleromaAccount.fromJsonString(resonse
          .body);
      String account =
          "${currentAccount.username}@${CurrentInstance.newInstance.currentClient.baseURL}";
      InstanceStorage currentStorage = InstanceStorage(
                account: account,
                currentClient: CurrentInstance.newInstance.currentClient,
                currentAccount: currentAccount,
                currentAuth: CurrentInstance.newInstance.currentAuth);
            currentStorage.saveInstanceData(currentStorage).then((_) {
              InstanceStorage.setCurrentAccount(account).then((result) {
                CurrentInstance.instance.setInstanceFromNewInstance();
                CurrentInstance.newInstance.loading = false;
                loadComplete();
              }).catchError((error){
                print(error);
              });
            }).catchError((error){
              print(error);
            });
          }).catchError((error) {
            var alert = Alert(
                context, AppLocalizations.of(context).tr(
                "current_instance.error.alert.title"),
                AppLocalizations.of(context).tr(
                    "current_instance.error.alert.content",
                    args: [error.toString()]), loadError);
            alert.showAlert();
          });
        }
      
}
