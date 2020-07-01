import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MediaAttachmentNonMediaItemWidget extends StatelessWidget {
  final double opacity;
  final Widget actionsWidget;
  final String filePath;

  MediaAttachmentNonMediaItemWidget({
    this.opacity = 1.0,
    @required this.actionsWidget,
    @required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    var fileName = basename(filePath);
    var fileExtension = extension(filePath);
    fileExtension = fileExtension?.replaceAll(".", "");

    if (fileExtension?.isNotEmpty != true) {
      fileExtension = "?";
    }

    return Container(
      height: 70,
      child: Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: FediColors.ultraLightGrey),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: FediColors.ultraLightGrey,
                        ),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: FediColors.darkGrey,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                              child: AutoSizeText(
                            fileExtension?.toUpperCase(),
                            maxLines: 1,
                            minFontSize: 8.0,
//                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: FediColors.darkGrey),
                          )),
                        ),
                      ),
                    )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileExtension?.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: FediColors.grey,
                                height: 1.5,
                                fontSize: 12),
                          ),
                          Text(
                            fileName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: FediColors.darkGrey,
                                height: 1.5,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (actionsWidget != null)
            Positioned(
              top: 0.0,
              bottom: 0.0,
              right: 16.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  actionsWidget,
                ],
              ),
            )
        ],
      ),
    );
  }
}
