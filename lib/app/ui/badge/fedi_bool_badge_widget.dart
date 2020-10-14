import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


abstract class FediBoolBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  static const unreadBadgeSize = 8.0;
  static const unreadBadgeDefaultOffset = 2.0;


  const FediBoolBadgeWidget({
    @required this.child,
    this.offset = unreadBadgeDefaultOffset,
  });

  Stream<bool> retrieveBoolStream(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: retrieveBoolStream(context).distinct(),
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
                    width: unreadBadgeSize,
                    height: unreadBadgeSize,
                    decoration: BoxDecoration(
                        color: FediColors.secondary,
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
