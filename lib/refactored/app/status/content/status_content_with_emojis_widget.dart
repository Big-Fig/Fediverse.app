import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusContentWithEmojisWidget extends StatelessWidget {
  final bool collapsible;

  const StatusContentWithEmojisWidget({@required this.collapsible});

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: collapsible
            ? statusBloc.contentWithEmojisCollapsibleStream
            : statusBloc.contentWithEmojisStream,
        initialData: collapsible
            ? statusBloc.contentWithEmojisCollapsible
            : statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithEmojisEmojis = snapshot.data;
          return HtmlTextWidget(
              data: contentWithEmojisEmojis,
              fontSize: 16.0,
              onLinkTap: (String link) async {
                await handleStatusContentLinkClick(
                    statusBloc: statusBloc, link: link, context: context);
              });
        });
  }
}
