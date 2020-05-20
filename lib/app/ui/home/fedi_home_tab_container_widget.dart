import 'package:fedi/app/instance/fedi_instance_image_decoration_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediHomeTabContainer extends StatelessWidget {
  final double topHeaderHeightInSafeArea;
  final double borderRadius;
  final Widget topBar;
  final Widget body;

  static const double _oneLineHeight = 104;

  const FediHomeTabContainer(
      {@required this.topHeaderHeightInSafeArea,
      @required this.topBar,
      @required this.body,
      this.borderRadius = 16.0});

  static FediHomeTabContainer createLikeAppBar({
    @required Widget leading,
    @required Widget center,
    @required Widget trailing,
    @required Widget body,
  }) {
    return FediHomeTabContainer(
        topHeaderHeightInSafeArea: _oneLineHeight,
        topBar: Stack(
          children: [
            if (leading != null)
              Align(
                alignment: Alignment.topLeft,
                child: leading,
              ),
            if (center != null)
              Align(
                alignment: Alignment.topCenter,
                child: center,
              ),
            if (leading != trailing)
              Align(
                alignment: Alignment.topRight,
                child: trailing,
              ),
          ],
        ),
        body: body);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Stack(
      children: <Widget>[
        Container(
          height: topHeaderHeightInSafeArea + statusBarHeight,
          child: FediInstanceImageDecorationWidget(
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
