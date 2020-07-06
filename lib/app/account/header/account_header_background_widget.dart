import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/image/fedi_dark_image_overlay.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AccountHeaderBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: accountBloc.headerStream,
        initialData: accountBloc.header,
        builder: (context, snapshot) {
          var header = snapshot.data;
          return CachedNetworkImage(
            imageUrl: header,
            imageBuilder: (context, imageProvider) {
              return FediDarkImageBackground(
                  child: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                  buildDarkOverlayContainer(child: null),
                ],
              ));
            },
            progressIndicatorBuilder: (context, url, progress) =>
                buildDarkOverlayContainer(
                    child: Center(child: FediCircularProgressIndicator())),
            errorWidget: (context, url, error) => buildDarkOverlayContainer(
              child: Center(
                child: Icon(
                  FediIcons.warning,
                  color: FediColors.error,
                ),
              ),
            ),
          );
        });
  }

  Widget buildDarkOverlayContainer({@required Widget child}) => Container(
      child: child,
      decoration: BoxDecoration(color: FediColors.imageDarkOverlay));

  const AccountHeaderBackgroundWidget();
}
