import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("fedi_instance_image_background_widget.dart");

class FediInstanceImageBackgroundWidget extends StatelessWidget {
  final Widget child;
  final Image defaultImage;

  const FediInstanceImageBackgroundWidget({
    @required this.child,
    this.defaultImage,
  });

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
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        // todo: think about unnecessary redraw performance
        return CachedNetworkImage(
          imageUrl: backgroundImageAbsolutePath,
          width: constraints.maxWidth,
          memCacheWidth: constraints.maxWidth.toInt(),
          errorWidget: (BuildContext context, String url, Object error) =>
              buildDefault(
            context: context,
            child: child,
          ),
          placeholder: (_, __) => Container(
            width: double.infinity,
            height: double.infinity,
            color: IFediUiColorTheme.of(context).primaryDark,
            child: child,
          ),
          imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
              buildWithImageProvider(
            context: context,
            imageProvider: imageProvider,
            child: child,
          ),
        );
      });
    } else {
      return buildDefault(
        context: context,
        child: child,
      );
    }
  }

  Widget buildDefault({
    @required BuildContext context,
    @required Widget child,
  }) {
    var imageProvider = defaultImage.image;
    return buildWithImageProvider(
      context: context,
      imageProvider: imageProvider,
      child: child,
    );
  }

  Widget buildWithImageProvider({
    @required BuildContext context,
    @required ImageProvider imageProvider,
    @required Widget child,
  }) {
    return RepaintBoundary(
      child: Stack(
        children: [
          Image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            image: imageProvider,
          ),
          const _FediInstanceImageBackgroundDarkOverlayWidget(child: null),
        ],
      ),
    );
  }
}

class _FediInstanceImageBackgroundDarkOverlayWidget extends StatelessWidget {
  const _FediInstanceImageBackgroundDarkOverlayWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        child: child,
        decoration: BoxDecoration(
            color: IFediUiColorTheme.of(context).imageDarkOverlay),
      );
}
