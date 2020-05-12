import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/header/fedi_header_image_decoration_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediHomeTabContainer extends StatelessWidget {
  final double topHeaderHeightInSafeArea;
  final double borderRadius;
  final Widget topBar;
  final Widget body;

  FediHomeTabContainer(
      {@required this.topHeaderHeightInSafeArea,
      @required this.topBar,
      @required this.body,
      this.borderRadius = 16.0});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Stack(
      children: <Widget>[
        Container(
          height: topHeaderHeightInSafeArea + statusBarHeight,
          child: FediHeaderImageDecorationWidget(
              child: SafeArea(
                  child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(alignment: Alignment.topCenter, child: topBar),
          ))),
        ),
        SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(top: topHeaderHeightInSafeArea - borderRadius),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius)),
              child: Container(
                decoration: BoxDecoration(
                  color: FediColors.offWhite,
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(borderRadius),
//                      topRight: Radius.circular(borderRadius)),
                ),
                child: body,
              ),
            ),
          ),
        )
      ],
    );
  }
}
