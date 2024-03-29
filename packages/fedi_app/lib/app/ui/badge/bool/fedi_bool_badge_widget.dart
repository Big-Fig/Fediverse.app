import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediBoolBadgeWidget extends StatelessWidget {
  final Widget child;
  final double offset;

  static const badgeSize = 8.0;
  static const badgeDefaultOffset = 2.0;

  const FediBoolBadgeWidget({
    Key? key,
    required this.child,
    this.offset = badgeDefaultOffset,
  }) : super(key: key);

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
                // ignore: no-equal-arguments
                top: offset,
                child: Container(
                  width: badgeSize,
                  // ignore: no-equal-arguments
                  height: badgeSize,
                  decoration: BoxDecoration(
                    color: IFediUiColorTheme.of(context).secondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
