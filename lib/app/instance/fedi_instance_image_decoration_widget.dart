import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("fedi_instance_image_decoration_widget.dart");

class FediInstanceImageDecorationWidget extends StatelessWidget {
  final Widget child;

  const FediInstanceImageDecorationWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var currentInstance = currentAuthInstanceBloc.currentInstance;
    var backgroundImage = currentInstance?.info?.backgroundImage;

    var backgroundImageAbsolutePath;

    // backgroundImageAbsolutePath maybe relative path or absolute absolute
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
          color: FediColors.grey,
        ),
        imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
            buildWithImageProvider(imageProvider, child),
      );
    } else {
      return buildDefault(child);
    }
  }

  Container buildDefault(SafeArea child) {
    var imageProvider = getDefaultHeaderImage().image;
    return buildWithImageProvider(imageProvider, child);
  }

  Container buildWithImageProvider(
      ImageProvider imageProvider, SafeArea child) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
        child: child);
  }

  Image getDefaultHeaderImage() =>
      Image.asset("assets/images/default_timeline_header.png");
}
