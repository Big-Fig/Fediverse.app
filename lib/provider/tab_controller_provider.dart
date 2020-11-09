import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef TabControllerCreator = TabController Function(
  BuildContext context,
  TickerProvider tickerProvider,
);

class TabControllerProvider extends StatefulWidget {
  final TabControllerCreator tabControllerCreator;
  final Widget child;

  TabControllerProvider({
    @required this.tabControllerCreator,
    @required this.child,
  });

  @override
  _TabControllerProviderState createState() => _TabControllerProviderState();
}

class _TabControllerProviderState extends State<TabControllerProvider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TabController>(
      create: (context) => widget.tabControllerCreator(
        context,
        this,
      ),
      dispose: (context, tabController) {
        tabController.dispose();
      },
      child: widget.child,
    );
  }
}
