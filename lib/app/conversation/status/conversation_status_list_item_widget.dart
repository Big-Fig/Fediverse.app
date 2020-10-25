import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _borderRadius = Radius.circular(16.0);

class ConversationStatusListItemWidget extends StatelessWidget {
  final bool isFirstInMinuteGroup;
  final bool isLastInMinuteGroup;

  ConversationStatusListItemWidget({
    @required this.isFirstInMinuteGroup,
    @required this.isLastInMinuteGroup,
  });

  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context, listen: false);

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);

    var deviceWidth = MediaQuery.of(context).size.width;

    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(statusBloc.status);

    var alignment =
        isStatusFromMe ? Alignment.centerRight : Alignment.centerLeft;
    var isHaveTextContent = statusBloc?.content?.isNotEmpty == true;
    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isStatusFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: isHaveTextContent
                    ? isStatusFromMe
                        ? IFediUiColorTheme.of(context).primaryDark
                        : IFediUiColorTheme.of(context).ultraLightGrey
                    : IFediUiColorTheme.of(context).transparent,
                borderRadius: isHaveTextContent
                    ? isStatusFromMe
                        ? BorderRadius.only(
                            topLeft: _borderRadius,
                            topRight: isLastInMinuteGroup
                                ? _borderRadius
                                : Radius.zero,
                            bottomLeft: _borderRadius)
                        : BorderRadius.only(
                            topLeft: isLastInMinuteGroup
                                ? _borderRadius
                                : Radius.zero,
                            topRight: _borderRadius,
                            bottomRight: _borderRadius)
                    : BorderRadius.zero,
              ),
              constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
              child: Padding(
                padding: isHaveTextContent
                    ? EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                    : EdgeInsets.zero,
                child: isHaveTextContent
                    ? buildContent(context, statusBloc, isStatusFromMe)
                    : ClipRRect(
                        borderRadius: isStatusFromMe
                            ? BorderRadius.only(
                                topLeft: _borderRadius,
                                topRight: isLastInMinuteGroup
                                    ? _borderRadius
                                    : Radius.zero,
                                bottomLeft: _borderRadius)
                            : BorderRadius.only(
                                topLeft: isLastInMinuteGroup
                                    ? _borderRadius
                                    : Radius.zero,
                                topRight: _borderRadius,
                                bottomRight: _borderRadius,
                              ),
                        child:
                            buildContent(context, statusBloc, isStatusFromMe),
                      ),
              ),
            ),
          ),
          if (isFirstInMinuteGroup)
            Align(
              alignment: alignment,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  TimeOfDay.fromDateTime(statusBloc.createdAt).format(context),
                  style: IFediUiTextTheme.of(context).smallShortMediumGrey,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget buildContent(
      BuildContext context, IStatusBloc statusBloc, bool isStatusFromMe) {
    return Column(
      children: <Widget>[
        buildTextContent(statusBloc, isStatusFromMe),
        buildMediaContent(statusBloc),
      ],
    );
  }

  Widget buildMediaContent(IStatusBloc statusBloc) =>
      StreamBuilder<List<IPleromaMediaAttachment>>(
          stream: statusBloc.mediaAttachmentsStream,
          initialData: statusBloc.mediaAttachments,
          builder: (context, snapshot) {
            var mediaAttachments = snapshot.data;

            return MediaAttachmentsWidget(
              mediaAttachments: mediaAttachments,
              initialMediaAttachment: null,
            );
          });

  Widget buildTextContent(IStatusBloc statusBloc, bool isStatusFromMe) =>
      StreamBuilder<String>(
          stream: statusBloc.contentWithEmojisStream,
          initialData: statusBloc.contentWithEmojis,
          builder: (context, snapshot) {
            var contentWithEmojis = snapshot.data;

            if (contentWithEmojis?.isNotEmpty == true) {
              return HtmlTextWidget(
                  htmlData: contentWithEmojis,
                  shrinkWrap: true,
                  color: isStatusFromMe
                      ? IFediUiColorTheme.of(context).white
                      : IFediUiColorTheme.of(context).darkGrey,
                  linkColor: isStatusFromMe
                      ? IFediUiColorTheme.of(context).white
                      : IFediUiColorTheme.of(context).primary,
                  fontSize: 16.0,
                  lineHeight: 1.5,
                  // data: contentWithEmojis,
                  onLinkTap: (context, url) async {
                    await UrlHelper.handleUrlClick(context, url);
                  });
            } else {
              return SizedBox.shrink();
            }
          });
}
