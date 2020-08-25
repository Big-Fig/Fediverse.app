import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: statusBloc.spoilerTextWithEmojisStream,
        initialData: statusBloc.spoilerTextWithEmojis,
        builder: (context, snapshot) {
          var spoiler = snapshot.data;

          if (spoiler?.isNotEmpty == true) {
            return HtmlTextWidget(
                data: spoiler,
                lineHeight: 1.5,
                fontSize: 16.0,
                onLinkTap: (String link) async {
                  await handleStatusContentLinkClick(
                      statusBloc: statusBloc, link: link, context: context);
                });
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const StatusSpoilerWidget();
}
