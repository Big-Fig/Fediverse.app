import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

const _nonMediaIconSize = 48.0 + 6.0;

const _rowHeight = 48.0 + 6.0;

class MediaFilePathWidget extends StatelessWidget {
  final double opacity;
  final Widget? actionsWidget;

  // final String filePath;

  const MediaFilePathWidget({
    this.opacity = 1.0,
    required this.actionsWidget, // @required this.filePath,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _rowHeight,
            child: Stack(
              children: [
                Opacity(
                  opacity: opacity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: FediBorderRadius.allSmallBorderRadius,
                      border: Border.all(
                        color: IFediUiColorTheme.of(context).ultraLightGrey,
                      ),
                    ),
                    child: Row(
                      children: const [
                        _MediaFilePathIconWidget(),
                        _MediaFilePathBodyWidget(),
                      ],
                    ),
                  ),
                ),
                if (actionsWidget != null)
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    right: FediSizes.bigPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        actionsWidget!,
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
}

class _MediaFilePathBodyWidget extends StatelessWidget {
  const _MediaFilePathBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaFilePathBloc = IMediaFilePathBloc.of(context);

    return Expanded(
      child: Padding(
        padding: FediPadding.allSmallPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mediaFilePathBloc.extension.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: IFediUiTextTheme.of(context).smallShortGrey,
            ),
            Text(
              mediaFilePathBloc.name,
              overflow: TextOverflow.ellipsis,
              style: IFediUiTextTheme.of(context).smallShortDarkGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaFilePathIconWidget extends StatelessWidget {
  const _MediaFilePathIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaFilePathBloc = IMediaFilePathBloc.of(context);

    return Container(
      width: _nonMediaIconSize,
      // ignore: no-equal-arguments
      height: _nonMediaIconSize,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: IFediUiColorTheme.of(context).ultraLightGrey,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: IFediUiColorTheme.of(context).darkGrey,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AutoSizeText(
                  mediaFilePathBloc.extension.toUpperCase(),
                  maxLines: 1,
                  // ignore: no-magic-number
                  minFontSize: 8.0,
                  style: IFediUiTextTheme.of(context).smallShortDarkGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
