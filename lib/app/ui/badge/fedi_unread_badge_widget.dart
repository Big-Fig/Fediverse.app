import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FediUnreadBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  const FediUnreadBadgeWidget({
    @required this.child,
    this.offset = 2.0,
  });

  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: retrieveUnreadBadgeCountStream(context).distinct(),
        builder: (context, snapshot) {
          var unread = snapshot.data;

          if (unread == true) {
            return Stack(
              children: [
                child,
                Positioned(
                  right: offset,
                  top: offset,
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                        color: FediColors.secondaryColor,
                        shape: BoxShape.circle),
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
