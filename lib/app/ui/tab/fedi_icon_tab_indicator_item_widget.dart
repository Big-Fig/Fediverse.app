import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconTabIndicatorItemWidget extends StatefulWidget {
  final IconData iconData;
  final int index;
  final TabController tabController;

  const FediIconTabIndicatorItemWidget(
      {@required this.iconData,
      @required this.index,
      @required this.tabController});

  @override
  _FediIconTabIndicatorItemWidgetState createState() =>
      _FediIconTabIndicatorItemWidgetState();
}

class _FediIconTabIndicatorItemWidgetState
    extends State<FediIconTabIndicatorItemWidget> {
  bool isSelected;
  VoidCallback listener;

  bool isDisposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    listener = () {
      if (!isDisposed) {
        if (!widget.tabController.indexIsChanging) {
          setState(() {
            updateIsSelected(widget.tabController);
          });
        }
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
      button = FediIconInCircleBlurredButton(
        widget.iconData,
        onPressed: onPressed,
      );
    }

    return button;
  }
}
