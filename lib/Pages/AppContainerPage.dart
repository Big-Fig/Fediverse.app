import 'package:flutter/material.dart';
import 'dart:core';
import 'package:phaze/Pages/TabPage.dart';
import '../Pleroma/Foundation/InstanceStorage.dart';
import './InstanceLoginPage.dart';
import './LoadingInstancePage.dart';
import '../Pleroma/Foundation/CurrentInstance.dart';

enum CurrentState { NONE, ADDNEW, LOADING, LOGGEDIN }

class AppContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppContainerPage();
  }
}

class _AppContainerPage extends State<AppContainerPage> {
  CurrentState appState = CurrentState.NONE;

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
    if (this.appState == CurrentState.NONE) {
      InstanceStorage.getCurrentAccount().then((account) {
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
        addNewInstance: addNewInstance,
        loadInstance: loadComplete,
      );
    } else {
      return InstanceLoginPage(
          close: this.closeNewLogIn,
          instanceSuccess: this.instanceSuccess,
          showClose: false);
    }
  }
}
