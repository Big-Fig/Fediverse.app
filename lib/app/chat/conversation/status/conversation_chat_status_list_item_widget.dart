import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc_impl.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_carousel_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _borderRadius = Radius.circular(16.0);

class ConversationChatStatusListItemWidget extends StatelessWidget {
  final bool isFirstInMinuteGroup;
  final bool isLastInMinuteGroup;

  ConversationChatStatusListItemWidget({
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
          builder: (context, snapshot) {
            var mediaAttachments = snapshot.data;

            if (mediaAttachments == null) {
              return SizedBox.shrink();
            }

            return DisposableProvider<IMediaAttachmentListBloc>(
              create: (context) => MediaAttachmentListBloc(
                mediaAttachments: mediaAttachments,
                initialMediaAttachment: null,
              ),
              child: const MediaAttachmentListCarouselWidget(),
            );
          });

  Widget buildTextContent(IStatusBloc statusBloc, bool isStatusFromMe) =>
      StreamBuilder<EmojiText>(
        stream: statusBloc.contentWithEmojisStream,
        initialData: statusBloc.contentWithEmojis,
        builder: (context, snapshot) {
          var contentWithEmojis = snapshot.data;

          if (contentWithEmojis?.text?.isNotEmpty == true) {
            var fediUiColorTheme = IFediUiColorTheme.of(context);
            var textScaleFactor = MediaQuery.of(context).textScaleFactor;
            return Provider<EmojiText>.value(
              value: contentWithEmojis,
              child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
                update: (context, emojiText, _) {
                  var htmlTextBloc = HtmlTextBloc(
                    inputData: HtmlTextInputData(
                      input: emojiText.text,
                      emojis: emojiText.emojis,
                    ),
                    settings: HtmlTextSettings(
                      shrinkWrap: true,
                      color: isStatusFromMe
                          ? fediUiColorTheme.white
                          : fediUiColorTheme.darkGrey,
                      linkColor: isStatusFromMe
                          ? fediUiColorTheme.white
                          : fediUiColorTheme.primary,
                      fontSize: 16.0,
                      lineHeight: 1.5,
                      drawNewLines: false,
                      textMaxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w300,
                      textScaleFactor: textScaleFactor,
                    ),
                  );
                  htmlTextBloc.addDisposable(
                    streamSubscription: htmlTextBloc.linkClickedStream.listen(
                      (url) {
                        UrlHelper.handleUrlClickWithInstanceLocation(
                          context: context,
                          url: url,
                          instanceLocationBloc: statusBloc,
                        );
                      },
                    ),
                  );
                  return htmlTextBloc;
                },
                child: const HtmlTextWidget(),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      );
}
