import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class StatusContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return InitialDataStreamBuilder<String>(
        stream: statusBloc.contentWithEmojisStream,
        initialData: statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithCustomEmojis = snapshot.data;



          return HtmlTextWidget(
              data: contentWithCustomEmojis,
              onLinkTap: (String link) async {
                var mentionedAccount =
                    await statusBloc.findMentionAccountByUrl(url: link);

                if (mentionedAccount != null) {
                  goToAccountDetailsPage(context, mentionedAccount);
                } else {
                  canLaunch(link).then((result) {
                    launch(link);
                  });
                }
              });
        });
  }
}
