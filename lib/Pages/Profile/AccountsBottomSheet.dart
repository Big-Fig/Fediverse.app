import 'dart:core';

import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/InstanceStorage.dart';

BuildContext _context;

class AccountsBottomSheet extends StatelessWidget {
  final Function addAccount;
  final Function swapAccount;

  AccountsBottomSheet({this.addAccount, this.swapAccount});

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
                                Text("Add Account"),
                              ],
                            ),
                          ),
                        );
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.fitHeight,
                                        placeholder:
                                            'assets/images/double_ring_loading_io.gif',
                                        image: instance.currentAccount.avatar,
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
                  child: Text("Getting account list"),
                ),
              );
            },
            future: InstanceStorage.getInstanceList());
      },
      onClosing: () {},
    );
  }
}
