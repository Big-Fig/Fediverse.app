import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _unreadBadgeSize = 8.0;
const _unreadBadgeDefaultOffset = 2.0;

abstract class FediUnreadBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  const FediUnreadBadgeWidget({
    @required this.child,
    this.offset = _unreadBadgeDefaultOffset,
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
                    width: _unreadBadgeSize,
                    height: _unreadBadgeSize,
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
