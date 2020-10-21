import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// const _nonMediaIconSize = 48.0 + 17.0;
// var _rowHeight = 48.0 + 17.0;

const _nonMediaIconSize = 48.0 + 6.0;

var _rowHeight = 48.0 + 6.0;

class MediaAttachmentNonMediaItemWidget extends StatelessWidget {
  final double opacity;
  final Widget actionsWidget;
  final String filePath;

  MediaAttachmentNonMediaItemWidget({
    this.opacity = 1.0,
    @required this.actionsWidget,
    @required this.filePath,
  }) {
    assert(filePath != null);
  }

  @override
  Widget build(BuildContext context) {
    var fileName = basename(filePath);
    var fileExtension = extension(filePath);
    fileExtension = fileExtension?.replaceAll(".", "");

    if (fileExtension?.isNotEmpty != true) {
      fileExtension = "?";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: _rowHeight,
          child: Stack(
            children: [
              Opacity(
                opacity: opacity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: FediBorderRadius.allSmallBorderRadius,
                    border: Border.all(
                        color: IFediUiColorTheme.of(context).ultraLightGrey),
                  ),
                  child: Row(
                    children: [
                      buildIconWidget(context, fileExtension),
                      buildBody(fileExtension, context, fileName)
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
                      actionsWidget,
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody(
          String fileExtension, BuildContext context, String fileName) =>
      Expanded(
        child: Padding(
          padding: FediPadding.allSmallPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileExtension?.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: IFediUiTextTheme.of(context).smallShortGrey,
              ),
              Text(
                fileName,
                overflow: TextOverflow.ellipsis,
                style: IFediUiTextTheme.of(context).smallShortDarkGrey,
              ),
            ],
          ),
        ),
      );

  Widget buildIconWidget(BuildContext context, String fileExtension) =>
      Container(
        width: _nonMediaIconSize,
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
            )),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AutoSizeText(
                    fileExtension?.toUpperCase(),
                    maxLines: 1,
                    minFontSize: 8.0,
                    style: IFediUiTextTheme.of(context).smallShortDarkGrey,
                  )),
            ),
          ),
        )),
      );
}
