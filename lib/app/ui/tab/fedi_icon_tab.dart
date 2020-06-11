import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconTab extends StatefulWidget {
  final IconData iconData;
  final int index;
  final TabController tabController;

  const FediIconTab(this.iconData,
      {@required this.index, @required this.tabController});

  @override
  _FediIconTabState createState() => _FediIconTabState();
}

class _FediIconTabState extends State<FediIconTab> {
  bool isSelected;
  VoidCallback listener;

  bool isDisposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    listener = () {
      if (!isDisposed) {
        setState(() {
          updateIsSelected(widget.tabController);
        });
      }
    };
    updateIsSelected(widget.tabController);
    widget.tabController.addListener(listener);
  }

  void updateIsSelected(TabController tabController) {
    isSelected = tabController.index == widget.index;
  }

  @override
  void dispose() {
    isDisposed = true;
    try {
      widget.tabController.removeListener(listener);
    } catch (e) {
      // just ignore. Sometimes tab controller already not exist
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var onPressed = () {
      widget.tabController.animateTo(widget.index);
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
