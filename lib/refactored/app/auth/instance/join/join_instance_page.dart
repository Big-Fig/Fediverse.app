import 'package:fedi/refactored/app/auth/instance/join/join_instance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class JoinInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaGreen,
      body: SafeArea(
        child: JoinInstanceWidget(),
      ),
    );
  }
}
