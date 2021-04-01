import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class AccountHeaderBackgroundWidget extends StatelessWidget {
  const AccountHeaderBackgroundWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    return StreamBuilder<String?>(
      stream: accountBloc.headerStream.distinct(),
      builder: (context, snapshot) {
        var header = snapshot.data;

        if (header == null) {
          return const _AccountHeaderBackgroundProgressWidget();
        }

        return Provider<String>.value(
          value: header,
          child: const _AccountHeaderBackgroundImageWidget(),
        );
      },
    );
  }
}

class _AccountHeaderBackgroundImageWidget extends StatelessWidget {
  const _AccountHeaderBackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String header = Provider.of<String>(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return IFilesCacheService.of(context).createCachedNetworkImageWidget(
          imageUrl: header,
          width: constraints.maxWidth,
          memCacheWidth: constraints.maxWidth.toInt(),
          imageBuilder: (context, imageProvider) {
            return Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
                const _AccountHeaderBackgroundDarkOverlayWidget(child: null),
              ],
            );
          },
          progressIndicatorBuilder: (context, url, progress) =>
              const _AccountHeaderBackgroundProgressWidget(),
          errorWidget: (context, url, error) =>
              const _AccountHeaderBackgroundErrorWidget(),
        );
      },
    );
  }
}

class _AccountHeaderBackgroundErrorWidget extends StatelessWidget {
  const _AccountHeaderBackgroundErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AccountHeaderBackgroundDarkOverlayWidget(
      child: Center(
        child: Icon(
          FediIcons.warning,
          color: IFediUiColorTheme.of(context).error,
        ),
      ),
    );
  }
}

class _AccountHeaderBackgroundProgressWidget extends StatelessWidget {
  const _AccountHeaderBackgroundProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const _AccountHeaderBackgroundDarkOverlayWidget(
        child: Center(
          child: FediCircularProgressIndicator(),
        ),
      );
}

class _AccountHeaderBackgroundDarkOverlayWidget extends StatelessWidget {
  const _AccountHeaderBackgroundDarkOverlayWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
        child: child,
        decoration: BoxDecoration(
          color: IFediUiColorTheme.of(context).imageDarkOverlay,
        ),
      );
}
