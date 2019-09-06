import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import '../Constants/AppThemeConsts.dart';
import '../Pleroma/Foundation/CurrentInstance.dart';
import '../Pleroma/Foundation/Requests/Accounts.dart';
import '../Pleroma/Foundation/InstanceStorage.dart';
import '../Views/Alert.dart';

class LoadingInstancePage extends StatelessWidget {
  final Function loadComplete;
  final Function loadError;

  LoadingInstancePage({this.loadComplete, this.loadError});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    getAccountStoreNewInstance(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaGreen,
      body: Container(
          width: deviceWidth,
          decoration: BoxDecoration(
            color: romaGreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Fetching account and instance data",
                  style: TextStyle(color: Colors.white.withOpacity(0.6))),
              SizedBox(
                  width: 60.0,
                  child:
                      Image.asset('assets/images/double_ring_loading_io.gif'))
            ],
          )),
    );
  }

  void getAccountStoreNewInstance(BuildContext context) async {
    CurrentInstance.newInstance.currentClient
        .run(path: Accounts.currentUser(), method: HTTPMethod.GET)
        .then((resonse) async {
      print("RESPONSE");
      print(resonse.body);

      Account currentAccount = accountFromJson(resonse.body);
      String account =
          "${currentAccount.username}@${CurrentInstance.newInstance.currentClient.baseURL}";
      InstanceStorage currentStorage = InstanceStorage(
          account: account,
          currentClient: CurrentInstance.newInstance.currentClient,
          currentAccount: currentAccount,
          currentAuth: CurrentInstance.newInstance.currentAuth);
      currentStorage.saveInstanceData(currentStorage).then((_) async {
        await InstanceStorage.setCurrentAccount(account);
        CurrentInstance.instance.setInstanceFromNewInstance();
        this.loadComplete();
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
