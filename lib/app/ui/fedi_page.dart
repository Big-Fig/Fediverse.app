import 'package:fedi/app/ui/fedi_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPage extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  FediPage({
    @required this.appBar,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) => FediWindow(
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
}
