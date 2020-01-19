import 'package:flutter/material.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import '../Pleroma/Models/ClientSettings.dart';
import '../Constants/AppThemeConsts.dart';
import '../Pleroma/Foundation/Client.dart';
import '../Views/ProgressDialog.dart';
import 'dart:convert';
import '../Views/Alert.dart';

class InstanceLoginPage extends StatefulWidget {
  final Function() instanceSuccess;
  final Function() close;

  final showClose;
  InstanceLoginPage(
      {Key key,
      @required this.instanceSuccess,
      @required this.close,
      @required this.showClose})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _InstanceLoginPage();
  }
}

class _InstanceLoginPage extends State<InstanceLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _instanceTextController = TextEditingController();
  ProgressDialog _pr;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaGreen,
      body: Container(
        width: deviceWidth,
        decoration: BoxDecoration(
          color: romaGreen,
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      child: Opacity(
                        opacity: widget.showClose == true ? 1 : 0,
                        child: IconButton(
                          alignment: Alignment.topLeft,
                          icon: Icon(Icons.close),
                          color: Colors.white,
                          iconSize: 34,
                          onPressed: widget.close,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                  ],
                ),
                Container(
                  child: Image(
                    image: AssetImage("assets/images/theme/logo.png"),
                    width: 60,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: targetWidth,
                  child: TextFormField(
                    controller: _instanceTextController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'Pleroma.site',
                      helperText: 'Pleroma or Mastodon Instance',
                      border: InputBorder.none,
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
                Spacer(),
                FlatButton(
                  child: Text('Login to Instance'),
                  color: darkGray,
                  textColor: Colors.white,
                  onPressed: () {
                    _pr =
                        new ProgressDialog(context, ProgressDialogType.Normal);
                    _pr.setMessage('Checking Instance');
                    _pr.show();
                    CurrentInstance.newInstance.currentClient =
                        Client(baseURL: _instanceTextController.text);

                    CurrentInstance.newInstance.currentClient
                        .register()
                        .then((response) {
                      _pr.hide();
                      if (response.statusCode != 200) {
                        print(response.statusCode);
                        var alert = Alert(
                            context,
                            "Not a valid instance (may be closed or dead)",
                            "Please enter a valid instance name like pleroma.site or mastodon.social",
                            () => {});
                        alert.showAlert();
                      } else {
                        var bodyJson = json.decode(response.body);
                        var client = new ClientSettings.fromJson(bodyJson);
                        CurrentInstance
                            .newInstance.currentClient.clientSettings = client;

                        InstanceStorage.saveNewInstanceClient(CurrentInstance
                            .newInstance.currentClient).then((_) {
                          CurrentInstance.newInstance.currentClient
                              .launchAuth((error) {
                            print(error.toString());
                            var alert = Alert(
                                context,
                                "Not a valid instance (may be closed or dead)",
                                "Please enter a valid instance name like pleroma.site or mastodon.social",
                                () => {});
                            alert.showAlert();
                          });
                        });
                      }
                    }).catchError((error) {
                      print(error.toString());
                      _pr.hide();
                      var alert = Alert(
                          context,
                          "Not a valid instance (may be closed or dead)",
                          "Please enter a valid instance name like pleroma.site or mastodon.social",
                          () => {});
                      alert.showAlert();
                    });
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                FlatButton(
                  child: Text(
                      "By using Fedi you agree to our terms. Tap to review"),
                  color: Colors.black12,
                  onPressed: () {
                    Navigator.pushNamed(context, '/terms');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
