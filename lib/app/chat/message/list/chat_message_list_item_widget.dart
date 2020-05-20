import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessageListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IChatMessageBloc messageBloc = IChatMessageBloc.of(context, listen: true);

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    if (myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage)) {
      return buildFromMeBody(context, messageBloc);
    } else {
      return buildNotFromMeBody(context, messageBloc);
    }
  }

  Widget buildFromMeBody(BuildContext context, IChatMessageBloc messageBloc) {
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
                child: buildContent(context, messageBloc),
              ),
            ),
          ],
        ));
  }

  Widget buildContent(BuildContext context, IChatMessageBloc messageBloc) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: StreamBuilder<Object>(
              stream: messageBloc.contentWithEmojisStream,
              initialData: messageBloc.contentWithEmojis,
              builder: (context, snapshot) {
                var contentWithEmojis = snapshot.data;

                if (contentWithEmojis != null) {
                  return HtmlTextWidget(
                      data: contentWithEmojis,
                      onLinkTap: (String link) async {
                        if (await canLaunch(link)) {
                          await launch(link);
                        }
                      });
                } else {
                  return SizedBox.shrink();
                }
              }),
        ),
        StreamBuilder<IPleromaMediaAttachment>(
            stream: messageBloc.mediaAttachmentStream,
            initialData: messageBloc.mediaAttachment,
            builder: (context, snapshot) {
              var mediaAttachment = snapshot.data;

              var mediaAttachments = <IPleromaMediaAttachment>[];

              if (mediaAttachment != null) {
                mediaAttachments.add(mediaAttachment);
              }

              return MediaAttachmentsWidget(
                mediaAttachments: mediaAttachments,
              );
            }),
      ],
    );
  }

  Widget buildNotFromMeBody(
      BuildContext context, IChatMessageBloc messageBloc) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                goToAccountDetailsPage(context, messageBloc.account);
              },
              child: StreamBuilder<String>(
                  stream: messageBloc.accountAvatarStream,
                  initialData: messageBloc.accountAvatar,
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
                  child: buildContent(context, messageBloc),
                ),
              ),
            ),
          ],
        ));
  }
}
