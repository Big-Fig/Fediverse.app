import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';

class StatusContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: statusBloc.contentWithEmojisStream,
        initialData: statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithCustomEmojis = snapshot.data;

          return HtmlTextWidget(
              data: contentWithCustomEmojis,
              onLinkTap: (String link) async {
                await handleStatusContentLink(
                    statusBloc: statusBloc, link: link, context: context);
              });
        });
  }
}
