import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("fedi_instance_image_background_widget.dart");

class FediInstanceImageBackgroundWidget extends StatelessWidget {
  final Widget child;

  const FediInstanceImageBackgroundWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var currentInstance = currentAuthInstanceBloc.currentInstance;

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var accountBackgroundImage = myAccountBloc.account.pleromaBackgroundImage;

    String backgroundImage = accountBackgroundImage;

    if (backgroundImage?.isNotEmpty != true) {
      backgroundImage = currentInstance?.info?.backgroundImage;
    }

    var backgroundImageAbsolutePath;

    // backgroundImage maybe relative path or absolute path]
    if (backgroundImage != null) {
      var backgroundImageUri = Uri.parse(backgroundImage);
      var isRelative = backgroundImageUri.host?.isNotEmpty != true;
      if (isRelative) {
        var hostPath = currentInstance.url.toString();
        backgroundImageAbsolutePath = hostPath + backgroundImage;
      } else {
        backgroundImageAbsolutePath = backgroundImage;
      }
    }

    _logger.finest(
        () => "backgroundImageAbsolutePath $backgroundImageAbsolutePath");
    if (backgroundImageAbsolutePath?.isNotEmpty == true) {
      // todo: think about unnecessary redraw performance
      return CachedNetworkImage(
        imageUrl: backgroundImageAbsolutePath,
        errorWidget: (BuildContext context, String url, Object error) =>
            buildDefault(child),
        placeholder: (_, __) => Container(
          width: double.infinity,
          height: double.infinity,
          color: FediColors.primaryDark,
          child: child,
        ),
        imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
            buildWithImageProvider(imageProvider, child),
      );
    } else {
      return buildDefault(child);
    }
  }

  Widget buildDefault(Widget child) {
    var imageProvider = getDefaultBackgroundImage().image;
    return buildWithImageProvider(imageProvider, child);
  }

  Widget buildWithImageProvider(ImageProvider imageProvider, Widget child) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    image: imageProvider)),
            child: child),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(color: FediColors.imageDarkOverlay),
        )
      ],
    );
  }

  Image getDefaultBackgroundImage() =>
      Image.asset("assets/images/default_timeline_header.png");
}
