import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediBoolBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  static const badgeSize = 8.0;
  static const badgeDefaultOffset = 2.0;

  const FediBoolBadgeWidget({
    @required this.child,
    this.offset = badgeDefaultOffset,
  });

  @override
  Widget build(BuildContext context) {
    var fediBoolBadgeBloc = IFediBoolBadgeBloc.of(context);

    return StreamBuilder<bool>(
        stream: fediBoolBadgeBloc.badgeStream.distinct(),
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
                    width: badgeSize,
                    height: badgeSize,
                    decoration: BoxDecoration(
                        color: IFediUiColorTheme.of(context).secondary,
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
