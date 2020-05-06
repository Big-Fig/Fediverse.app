import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/refactored/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/refactored/app/status/card/status_card_widget.dart';
import 'package:fedi/refactored/app/status/content/status_content_with_emojis_without_accounts_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationStatusListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context, listen: true);

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    if (myAccountBloc.checkIsStatusFromMe(statusBloc.status)) {
      return buildFromMeBody(context, statusBloc);
    } else {
      return buildNotFromMeBody(context, statusBloc);
    }
  }

  Widget buildFromMeBody(BuildContext context, IStatusBloc statusBloc) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Color(0xffececec),
                constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
                child: buildContent(context, statusBloc),
              ),
            ),
          ],
        ));
  }

  Padding buildContent(BuildContext context, IStatusBloc statusBloc) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Container(
          child: Column(
            children: <Widget>[
              StatusContentWithEmojisWithoutAccountsWidget(),
              StatusCardWidget(),
              MediaAttachmentsWidget(),
            ],
          ),
        ));
  }

  Widget buildNotFromMeBody(BuildContext context, IStatusBloc statusBloc) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                goToAccountDetailsPage(context, statusBloc.account);
              },
              child: StreamBuilder<String>(
                  stream: statusBloc.accountAvatarStream,
                  initialData: statusBloc.accountAvatar,
                  builder: (context, snapshot) {
                    var accountAvatar = snapshot.data;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: AccountAvatarWidget.buildAccountAvatarWidget(
                          avatarUrl: accountAvatar,
                          progressSize: 30,
                          imageSize: 30),
                    );
                  }),
            ),
            SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)),
                constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Stack(
                    children: <Widget>[
                      buildContent(context, statusBloc),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: StatusFavouriteActionWidget(
                          displayCounter: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
