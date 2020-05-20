import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

var _logger = Logger("fedi_instance_image_decoration_widget.dart");

class FediInstanceImageDecorationWidget extends StatelessWidget {
  final Widget child;

  const FediInstanceImageDecorationWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var backgroundImage =
        currentAuthInstanceBloc.currentInstance?.info?.backgroundImage;

    _logger.finest(() => "backgroundImage $backgroundImage");
    if (backgroundImage?.isNotEmpty == true) {
      // todo: think about unnecessary redraw performance
      return CachedNetworkImage(
        imageUrl: backgroundImage,
        errorWidget: (BuildContext context, String url, Object error) =>
            buildDefault(child),
        placeholder: (BuildContext context, String url) => buildDefault(child),
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
        child: child);
  }

  Image getDefaultHeaderImage() =>
      Image.asset("assets/images/default_timeline_header.png");
}
