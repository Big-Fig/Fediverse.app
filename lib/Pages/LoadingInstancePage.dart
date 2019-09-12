import 'package:flutter/material.dart';
import '../Constants/AppThemeConsts.dart';
import '../Pleroma/Foundation/CurrentInstance.dart';

class LoadingInstancePage extends StatelessWidget {
  final Function loadComplete;
  final Function loadError;

  LoadingInstancePage({this.loadComplete, this.loadError});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    CurrentInstance.newInstance
        .getAccountStoreNewInstance(context, loadComplete, loadError);
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
}
