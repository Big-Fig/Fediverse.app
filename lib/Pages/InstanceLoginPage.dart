import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:flutter/material.dart';

import '../Constants/AppThemeConsts.dart';
import '../Pleroma/Foundation/Client.dart';
import '../Pleroma/Models/ClientSettings.dart';
import '../Views/Alert.dart';
import '../Views/ProgressDialog.dart';

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
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    controller: _instanceTextController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: AppLocalizations.of(context)
                      .tr("login.field.host.hint"),
                      helperText: AppLocalizations.of(context)
                      .tr("login.field.host.helper_text"),
                      border: InputBorder.none,
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
                Spacer(),
                FlatButton(
                  child: Text(
                      AppLocalizations.of(context)
                          .tr("login.action.login_to_instance")
                      ),
                  color: darkGray,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_instanceTextController.text == ""){
                      return;
                    }
                    _pr =
                        new ProgressDialog(context, ProgressDialogType.Normal);
                    _pr.setMessage(AppLocalizations.of(context).tr(
                        "login.check.progress"));
                    _pr.show();

                    var instance = _instanceTextController.text.split("/").first;
                    CurrentInstance.newInstance.currentClient =
                        Client(baseURL: instance);

                    CurrentInstance.newInstance.currentClient
                        .register()
                        .then((response) {
                      _pr.hide();
                      if (response.statusCode != 200) {
                        print(response.statusCode);
                        var alert = Alert(
                            context,
                            AppLocalizations.of(context).tr(
                                "login.check.error.alert.title"),
                            AppLocalizations.of(context).tr(
                                "login.check.error.alert.content"),
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
                              .launchAuth(context, (error) {
                            print(error.toString());
                            var alert = Alert(
                                context,
                                AppLocalizations.of(context).tr(
                                    "login.check.error.alert.title"),
                                AppLocalizations.of(context).tr(
                                    "login.check.error.alert.content"),
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
                          AppLocalizations.of(context).tr(
                              "login.check.error.alert.title"),
                          AppLocalizations.of(context).tr(
                              "login.check.error.alert.content"),
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
                      AppLocalizations.of(context).tr(
                          "login.action.terms")),
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
