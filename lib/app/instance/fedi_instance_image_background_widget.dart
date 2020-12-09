import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

var urlPath = path.posix;

final Image defaultImage =
    Image.asset("assets/images/default_timeline_header.png");
var _logger = Logger("fedi_instance_image_background_widget.dart");

class FediInstanceImageBackgroundWidget extends StatelessWidget {
  const FediInstanceImageBackgroundWidget();
  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);

    var currentInstance = currentAuthInstanceBloc.currentInstance;

    var myAccountBloc = IMyAccountBloc.of(context);

    return StreamBuilder<String>(
      stream: myAccountBloc.pleromaBackgroundImageStream,
      builder: (context, snapshot) {
        var accountBackgroundImage = snapshot.data;

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

        return Provider<String>.value(
          value: backgroundImageAbsolutePath,
          child: const _FediInstanceImageBackgroundCachedNetworkImageWidget(),
        );
      },
    );
  }
}

class _FediInstanceImageBackgroundCachedNetworkImageWidget
    extends StatelessWidget {
  const _FediInstanceImageBackgroundCachedNetworkImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundImageAbsolutePath = Provider.of<String>(context);

    if (backgroundImageAbsolutePath?.isNotEmpty == true) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return CachedNetworkImage(
          imageUrl: backgroundImageAbsolutePath,
          width: constraints.maxWidth,
          memCacheWidth: constraints.maxWidth.toInt(),
          errorWidget: (BuildContext context, String url, Object error) =>
              buildDefault(
            context: context,
          ),
          placeholder: (_, __) =>
              const _FediInstanceImageBackgroundPlaceholderWidget(),
          imageBuilder: (BuildContext context, ImageProvider imageProvider) {
            return Provider<ImageProvider>.value(
              value: imageProvider,
              child: const _FediInstanceImageBackgroundImageProviderWidget(),
            );
          },
        );
      });
    } else {
      return buildDefault(
        context: context,
      );
    }
  }
}

Widget buildDefault({
  @required BuildContext context,
}) {
  return Provider<ImageProvider>.value(
    value: defaultImage.image,
    child: const _FediInstanceImageBackgroundImageProviderWidget(),
  );
}

class _FediInstanceImageBackgroundPlaceholderWidget extends StatelessWidget {
  const _FediInstanceImageBackgroundPlaceholderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: IFediUiColorTheme.of(context).primaryDark,
    );
  }
}

class _FediInstanceImageBackgroundImageProviderWidget extends StatelessWidget {
  const _FediInstanceImageBackgroundImageProviderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<ImageProvider>(context);
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
