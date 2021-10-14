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

  const TabControllerProvider({
    Key? key,
    required this.tabControllerCreator,
    required this.child,
  }) : super(key: key);

  @override
  TabControllerProviderState createState() => TabControllerProviderState();
}

class TabControllerProviderState extends State<TabControllerProvider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => ListenableProvider<TabController>(
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
