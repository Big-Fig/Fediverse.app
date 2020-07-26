import 'package:fedi/app/ui/button/text/fedi_blurred_text_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTextTabIndicatorItemWidget extends StatefulWidget {
  final String label;
  final int index;
  final bool isTransparent;
  final TabController tabController;

  const FediTextTabIndicatorItemWidget({
    @required this.label,
    @required this.index,
    @required this.isTransparent,
    @required this.tabController,
  });

  @override
  _FediTextTabIndicatorItemWidgetState createState() =>
      _FediTextTabIndicatorItemWidgetState();
}

class _FediTextTabIndicatorItemWidgetState
    extends State<FediTextTabIndicatorItemWidget> {
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

    Widget text;
    var fontSize = 16.0;
    var lineHeight = 1.5;

    if (isSelected) {
      text = FediPrimaryFilledTextButton(
        widget.label,
        onPressed: onPressed,
        textStyle: FediPrimaryFilledTextButton.defaultTextStyle.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          height: lineHeight,
        ),
        enabledBackgroundColor: FediColors.primaryColor.withOpacity(0.8),

      );
    } else {
      var fontWeight = FontWeight.normal;
      if (widget.isTransparent) {
        text = FediBlurredTextButton(
          widget.label,
          onPressed: onPressed,
          textStyle: FediBlurredTextButton.defaultTextStyle.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: lineHeight,
          ),
        );
      } else {
        text = FediTransparentTextButton(
          widget.label,
          onPressed: onPressed,
          textStyle: FediTransparentTextButton.defaultTextStyle.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: lineHeight,
          ),
          color: FediColors.mediumGrey,
        );
      }
    }

    return text;
  }
}
