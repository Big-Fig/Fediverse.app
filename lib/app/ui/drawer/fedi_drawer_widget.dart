import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediDrawerWidget extends StatelessWidget {
  final String headerText;
  final Widget child;

  FediDrawerWidget({@required this.headerText, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            buildHeaderWidget(context),
            Expanded(
              child: Padding(
                padding: FediPadding.horizontalBigPadding,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DrawerHeader(
        child: Text(
          headerText,
          style: FediTextStyles.subHeaderShortWhite,
        ),
        decoration: BoxDecoration(
          color: FediColors.primaryColor,
        ),
      ),
    );
  }
}
