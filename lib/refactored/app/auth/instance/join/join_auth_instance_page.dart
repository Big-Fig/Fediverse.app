import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class JoinAuthInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaGreen,
      body: SafeArea(
        child: JoinAuthInstanceWidget(),
      ),
    );
  }
}
