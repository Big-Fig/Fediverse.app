import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusContentWithEmojisWidget extends StatelessWidget {
  final bool collapsible;

  const StatusContentWithEmojisWidget({@required this.collapsible});

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    var useCollapsible = collapsible && statusBloc.isPossibleToCollapse;
    return StreamBuilder<String>(
        stream: useCollapsible
            ? statusBloc.contentWithEmojisCollapsibleStream
            : statusBloc.contentWithEmojisStream,
        initialData: useCollapsible
            ? statusBloc.contentWithEmojisCollapsible
            : statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithEmojisEmojis = snapshot.data;
          return HtmlTextWidget(
              data: contentWithEmojisEmojis,
              lineHeight: 1.5,
              fontSize: 16.0,
              onLinkTap: (String link) async {
                await handleStatusContentLinkClick(
                    statusBloc: statusBloc, link: link, context: context);
              });
        });
  }
}
