import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';

class StatusContentWithEmojisWithoutAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: statusBloc.contentWithEmojisWithoutAccountStream,
        initialData: statusBloc.contentWithEmojisWithoutAccount,
        builder: (context, snapshot) {
          var content = snapshot.data;

          return HtmlTextWidget(
              data: content,
              onLinkTap: (String link) async {
                await handleStatusContentLinkClick(
                    statusBloc: statusBloc, link: link, context: context);
              });
        });
  }
}
