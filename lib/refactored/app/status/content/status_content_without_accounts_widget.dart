import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
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
