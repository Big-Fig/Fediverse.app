import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/content/statuc_content_link_helper.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class StatusContentWithoutAccountsWidget extends StatelessWidget {
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
                await handleStatusContentLink(
                    statusBloc: statusBloc, link: link, context: context);
              });
        });
  }
}
