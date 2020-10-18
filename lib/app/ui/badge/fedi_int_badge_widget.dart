import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FediIntBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  static const unreadBadgeSize = 18.0;
  static const unreadBadgeDefaultOffset = 8.0;

  const FediIntBadgeWidget({
    @required this.child,
    this.offset = unreadBadgeDefaultOffset,
  });

  Stream<int> retrieveIntStream(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: retrieveIntStream(context).distinct(),
        builder: (context, snapshot) {
          var count = snapshot.data;

          if (count != null && count > 0) {
            return Stack(
              alignment: Alignment.center,
              children: [
                child,
                Positioned(
                  left: offset,
                  top: offset,
                  child: Container(
                    width: unreadBadgeSize,
                    height: unreadBadgeSize,
                    decoration: BoxDecoration(
                      color: IFediUiColorTheme.of(context).secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        count.toString(),
                        style: IFediUiTextTheme.of(context).smallShortWhite,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return child;
          }
        });
  }
}
