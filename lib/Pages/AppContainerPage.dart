import 'package:flutter/material.dart';
import 'package:fedi/DeepLinks/DeepLinkHelper.dart';
import 'dart:core';
import 'package:fedi/Pages/TabPage.dart';
import '../Pleroma/Foundation/InstanceStorage.dart';
import './InstanceLoginPage.dart';
import './LoadingInstancePage.dart';
import '../Pleroma/Foundation/CurrentInstance.dart';

enum CurrentState { NONE, ADDNEW, LOADING, LOGGEDIN, LOGGEDOUT }

class AppContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppContainerPage();
  }
}

class _AppContainerPage extends State<AppContainerPage> {
  int initalIndex = 0;
  CurrentState appState = CurrentState.NONE;
  DeepLinkHelper links = DeepLinkHelper.instance;

  void instanceSuccess() {
    setState(() {
      this.appState = CurrentState.LOADING;
    });
  }

  void closeNewLogIn() {
    setState(() {
      this.appState = CurrentState.NONE;
    });
  }

  void loadComplete() {
    setState(() {
      this.appState = CurrentState.NONE;
    });
  }

  void refreshInstance() {
    print("UPDATING STATE UPDATEING STATE");
    setState(() {
      this.initalIndex = 4;
      this.appState = CurrentState.LOGGEDIN;
    });
  }

  void logOut() {
    setState(() {
      this.appState = CurrentState.LOGGEDOUT;
    });
  }

  void loadError() {
    setState(() {
      this.appState = CurrentState.NONE;
    });
  }

  void addNewInstance() {
    setState(() {
      this.appState = CurrentState.ADDNEW;
    });
  }

  @override
  Widget build(BuildContext context) {
    links.instanceSuccess = this.instanceSuccess;
    DeepLinkHelper.initUniLinks();

    if (this.appState == CurrentState.LOGGEDOUT) {
      InstanceStorage.getNextInstance().then((instanceStorage){
          print("WE GOT NEXT INSTANCE!!!!!!!");
            if (instanceStorage == null){
              return;
            }
            InstanceStorage.setCurrentAccount(instanceStorage.account);
             CurrentInstance.instance.currentAccount =
                instanceStorage.currentAccount;
            CurrentInstance.instance.currentAuth = instanceStorage.currentAuth;
            CurrentInstance.instance.currentClient =
                instanceStorage.currentClient;

            setState(() {
              this.appState = CurrentState.LOGGEDIN;
            });
          });
    } else if (this.appState == CurrentState.NONE) {
      InstanceStorage.getCurrentAccount().then((account) {
        print("swapping the account!!!!");
        print(account);
        if (account != null) {
          InstanceStorage.getInstanceStorageByAccount(account)
              .then((instanceStorage) {
            CurrentInstance.instance.currentAccount =
                instanceStorage.currentAccount;
            CurrentInstance.instance.currentAuth = instanceStorage.currentAuth;
            CurrentInstance.instance.currentClient =
                instanceStorage.currentClient;

            setState(() {
              this.appState = CurrentState.LOGGEDIN;
            });
          });
        }
      });
    }

    if (this.appState == CurrentState.NONE) {
      return InstanceLoginPage(
          close: this.closeNewLogIn,
          instanceSuccess: this.instanceSuccess,
          showClose: false);
    } else if (this.appState == CurrentState.ADDNEW) {
      return InstanceLoginPage(
          close: this.closeNewLogIn,
          instanceSuccess: this.instanceSuccess,
          showClose: true);
    } else if (this.appState == CurrentState.LOADING) {
      return LoadingInstancePage(
          loadComplete: this.loadComplete, loadError: this.loadError);
    } else if (this.appState == CurrentState.LOGGEDIN) {
      return TabPage(
        initalIndex,
        addNewInstance: addNewInstance,
        refreshInstance: refreshInstance,
        loadInstance: loadComplete,
        logout: logOut,
      );
    } else {
      return InstanceLoginPage(
          close: this.closeNewLogIn,
          instanceSuccess: this.instanceSuccess,
          showClose: false);
    }
  }
}
