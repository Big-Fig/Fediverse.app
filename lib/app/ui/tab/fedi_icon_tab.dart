import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconTab extends StatefulWidget {
  final IconData iconData;
  final int index;

  const FediIconTab(this.iconData, {@required this.index});

  @override
  _FediIconTabState createState() => _FediIconTabState();
}

class _FediIconTabState extends State<FediIconTab> {

  bool isSelected;
  VoidCallback listener;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var tabController = DefaultTabController.of(context);
    listener = () {
      setState(() {
        updateIsSelected(tabController);
      });
    };
    updateIsSelected(tabController);
    tabController.addListener(listener);
  }

  void updateIsSelected(TabController tabController) {
    isSelected = tabController.index == widget.index;
  }

  @override
  void dispose() {
    try {
      var tabController = DefaultTabController.of(context);
      tabController.removeListener(listener);
    } catch(e) {
      // just ignore. Sometimes tab controller already not exist
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var onPressed = () {
      var tabController = DefaultTabController.of(context);
      tabController.animateTo(widget.index);
    };

    Widget button;
    if (isSelected) {
      button = FediIconInCircleFilledButton(
        widget.iconData,
        onPressed: onPressed,
      );
    } else {
      button = FediIconInCircleTransparentButton(
        widget.iconData,
        onPressed: onPressed,
      );
    }

    return button;
  }
}
