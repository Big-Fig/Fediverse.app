import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediHomeSliverPage extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  FediHomeSliverPage({
    @required this.appBar,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [appBar];
        },
        body: body,
    );
  }
}
