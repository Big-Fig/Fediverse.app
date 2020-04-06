import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';

BuildContext _context;

class MyAccountActionsBottomSheetDialog extends StatelessWidget {
  final Function addAccount;
  final Function swapAccount;
  final Function logout;

  MyAccountActionsBottomSheetDialog(
      {this.addAccount, this.swapAccount, this.logout});

  hide() {
    Navigator.of(_context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    _context = context;
    return BottomSheet(
      builder: (BuildContext context) {
        return FutureBuilder(
            builder: (BuildContext context,
                AsyncSnapshot<List<InstanceStorage>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return Container(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (index == (snapshot.data.length)) {
                        return buildAddAccountWidget(context);
                      } else {
                        var currentURL =
                            "${CurrentInstance.instance.currentClient.baseURL}"
                                .replaceAll("https://", "@");
                        var client =
                            "${CurrentInstance.instance.currentAccount.acct}$currentURL";
                        print(client);
                        var instance = snapshot.data[index];
                        var instanceURL = "${instance.currentClient.baseURL}"
                            .replaceAll("https://", "@");
                        var thisClient =
                            "${instance.currentAccount.acct}$instanceURL";
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            print("tap");
                            if (thisClient != client) {
                              print(instance.account);
                              InstanceStorage.setCurrentAccount(
                                      instance.account)
                                  .then((future) {
                                swapAccount();
                              });
                            }
                          },
                          child: SizedBox(
                            height: 80,
                            width: deviceWidth,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      var alert = Alert(
                                          context,
                                          AppLocalizations.of(context)
                                              .tr("profile.accounts"
                                                  ".log_out.alert.title"),
                                          AppLocalizations.of(context).tr(
                                              "profile.accounts"
                                              ".log_out.alert.content",
                                              args: [thisClient]), () {
                                        InstanceStorage.setCurrentAccount(
                                                instance.account)
                                            .then((future) {
                                          PushHelper.instance.unregister();

                                          InstanceStorage.removeInstanceData(
                                                  instance)
                                              .then((_) {
                                            logout();
                                          });
                                        });
                                      },
                                          actionButtonTitle:
                                              AppLocalizations.of(context)
                                                  .tr("profile.accounts.action"
                                                      ".log_out"),
                                          showCancel: true);
                                      alert.showAlert();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 10),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            instance.currentAccount.avatar,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      thisClient,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                if (thisClient == client)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    itemCount: (snapshot.data.length + 1),
                  ),
                );
              }
              return Container(
                child: Center(
                  child: Text(AppLocalizations.of(context)
                      .tr("profile.accounts.accounts_list")),
                ),
              );
            },
            future: InstanceStorage.getInstanceList());
      },
      onClosing: () {},
    );
  }

  GestureDetector buildAddAccountWidget(BuildContext context) {
    return GestureDetector(
      onTap: addAccount,
      child: Container(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.black,
            ),
            Text(
                AppLocalizations.of(context).tr("profile.accounts.action.add")),
          ],
        ),
      ),
    );
  }
}

showMyAccountActionsBottomSheetDialog(BuildContext context) {
  showModalBottomSheet(
      builder: (BuildContext context) => BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              height: 300,
              child: DisposableProvider<IAuthInstanceChooserBloc>(
                  create: (context) =>
                      AuthInstanceChooserBloc.createFromContext(context),
                  child: AuthInstanceChooserWidget()),
            );
          },
        ),
      context: context);
}

logout() {
//  bottomSheet.hide();
//  widget.logout();
}

addAccount() {
//  bottomSheet.hide();
//  widget.addNewInstance();
}

swapAccount() {
//  print("SWAP account");
//  if (bottomSheet != null) {
//    bottomSheet.hide();
//  }
//
//  widget.loadInstance();
}
