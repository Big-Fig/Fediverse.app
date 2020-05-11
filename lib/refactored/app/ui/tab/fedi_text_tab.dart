import 'package:fedi/refactored/app/ui/button/text/fedi_filled_text_button.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTextTab extends StatefulWidget {
  final String label;
  final int index;

  FediTextTab(this.label, {@required this.index});

  @override
  _FediTextTabState createState() => _FediTextTabState();
}

class _FediTextTabState extends State<FediTextTab> {

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

    Widget text;
    if (isSelected) {
      text = FediFilledTextButton(widget.label, onPressed:onPressed);
    } else {
      text = FediTransparentTextButton(widget.label, onPressed:onPressed);
    }

    return text;
  }
}
