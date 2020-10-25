import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/status/content/status_content_link_helper.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final _logger = Logger("status_content_with_emojis_widget.dart");

void _onLinkTap(
  BuildContext context,
  String url,
) async {
  await handleStatusContentLinkClick(
    context: context,
    statusBloc: IStatusBloc.of(context, listen: false),
    link: url,
  );
}

class StatusContentWithEmojisWidget extends StatelessWidget {
  final bool collapsible;

   StatusContentWithEmojisWidget({
    @required this.collapsible,
  });

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    _logger.finest(() => "build collapsible $collapsible "
        "statusBloc ${statusBloc.remoteId}");

    var isNeedCollapse = collapsible && statusBloc.isPossibleToCollapse;
    return StreamBuilder<String>(
        stream: statusBloc.contentWithEmojisStream.distinct(),
        initialData: statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithEmojisEmojis = snapshot.data;

          _logger
              .finest(() => "contentWithEmojisEmojis $contentWithEmojisEmojis");

          // if (contentWithEmojisEmojis == null) {
          //   return SizedBox.shrink();
          // }

          if (contentWithEmojisEmojis?.isNotEmpty == true) {
            var htmlTextWidget = HtmlTextWidget(
              htmlData: contentWithEmojisEmojis,
              lineHeight: 1.5,
              fontSize: 16.0,
              // todo: 1000 is hack, actually it should be null, but don't
              //  work as expected
              textMaxLines: 1000,
              textOverflow: TextOverflow.ellipsis,
              onLinkTap: _onLinkTap,
              // onLinkTap: (String link) async {
              //   await handleStatusContentLinkClick(
              //     context: context,
              //     statusBloc: statusBloc,
              //     link: link,
              //   );
              // }),
            );
            //
            // var htmlTextWidget = HtmlTextWidget(
            //     data: contentWithEmojisEmojis,
            //     lineHeight: 1.5,
            //     fontSize: 16.0,
            //     // todo: 1000 is hack, actually it should be null, but don't
            //     //  work as expected
            //     textMaxLines: 1000,
            //     textOverflow: TextOverflow.ellipsis,
            //     onLinkTap: (String link) async {
            //       await handleStatusContentLinkClick(
            //         context: context,
            //         statusBloc: statusBloc,
            //         link: link,
            //       );
            //     });

            return StreamBuilder<bool>(
                stream: statusBloc.isCollapsedStream.distinct(),
                initialData: statusBloc.isCollapsed,
                builder: (context, snapshot) {
                  var isCollapsed = snapshot.data;
                  if (isCollapsed && isNeedCollapse) {
                    return Container(
                      height: 200,
                      child: htmlTextWidget,
                    );
                  } else {
                    return htmlTextWidget;
                  }
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
