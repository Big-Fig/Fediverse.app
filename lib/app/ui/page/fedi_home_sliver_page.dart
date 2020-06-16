import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
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
      controller:
          IScrollControllerBloc.of(context, listen: false).scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [appBar];
      },
      body: body,
    );
  }
}
