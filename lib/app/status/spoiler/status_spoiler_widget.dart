import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/status/content/status_content_link_helper.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return Provider<HtmlTextData>.value(
              value: HtmlTextData(
                source: statusBloc,
                htmlData: spoiler,
              ),
              child: const HtmlTextWidget(
                  lineHeight: 1.5, fontSize: 16.0, onLinkTap: _handleLinkTap),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const StatusSpoilerWidget();
}

void _handleLinkTap(context, htmlTextData, url) async {
  await handleStatusContentLinkClick(
      statusBloc: htmlTextData.source, link: url, context: context);
}
