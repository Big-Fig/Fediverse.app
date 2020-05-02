import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: statusBloc.contentWithEmojisStream,
        initialData: statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithCustomEmojis = snapshot.data;

          return Column(
            children: <Widget>[
              StreamBuilder<bool>(
                  stream: statusBloc.isNeedShowFullContentStream,
                  initialData: statusBloc.isNeedShowFullContent,
                  builder: (context, snapshot) {
                    var isNeedShowFullContent = snapshot.data;

                    var contentToDisplay;
                    if (!isNeedShowFullContent) {
                      contentToDisplay =
                          contentWithCustomEmojis.substring(0, 400);
                    } else {
                      contentToDisplay = contentWithCustomEmojis;
                    }
                    return HtmlTextWidget(
                        data: contentToDisplay,
                        onLinkTap: (String link) async {
                          await handleStatusContentLink(
                              statusBloc: statusBloc,
                              link: link,
                              context: context);
                        });
                  }),
              if (statusBloc.isPossibleToCollapse)
                Center(
                    child: FlatButton(
                  color: Colors.blue,
                  child: StreamBuilder<bool>(
                      stream: statusBloc.isCollapsedStream,
                      initialData: statusBloc.isCollapsed,
                      builder: (context, snapshot) {
                        var isCollapsed = snapshot.data;
                        return Text(
                          isCollapsed ? "Expand" : "Collapse",
                          style: TextStyle(color: Colors.white),
                        );
                      }),
                  onPressed: () {
                    var collapsibleBloc =
                        ICollapsibleBloc.of(context, listen: false);
                    collapsibleBloc.changeCurrentVisibleItem(statusBloc);
                    statusBloc.toggleCollapse();
                  },
                ))
            ],
          );
        });
  }
}
