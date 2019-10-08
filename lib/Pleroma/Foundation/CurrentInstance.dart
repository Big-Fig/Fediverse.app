import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Foundation/InstanceStorage.dart';
import 'package:phaze/Views/Alert.dart';
import './Client.dart';
import '../Models/Account.dart';
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
  Account currentAccount;
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
      Account currentAccount = accountFromJson(resonse.body);
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
              });
            });
          }).catchError((error) {
            var alert = Alert(
                context,
                "Error",
                "Can't Fetch Account at this time. Please try to log in again.$error",
                loadError);
            alert.showAlert();
          });
        }
      
}
