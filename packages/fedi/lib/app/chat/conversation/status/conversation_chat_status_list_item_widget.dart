import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc_impl.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_carousel_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

const _borderRadius = Radius.circular(16.0);

class ConversationChatStatusListItemWidget extends StatelessWidget {
  final bool isFirstInMinuteGroup;
  final bool isLastInMinuteGroup;

  const ConversationChatStatusListItemWidget({
    Key? key,
    required this.isFirstInMinuteGroup,
    required this.isLastInMinuteGroup,
  }) : super(key: key);

  @override
  // todo: refactor. use common code with unifedi_chat_list_item_widget
  // ignore: long-method
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(statusBloc.status);

    var alignment =
        isStatusFromMe ? Alignment.centerRight : Alignment.centerLeft;
    var isHaveTextContent = statusBloc.isHaveTextContent;

    var deviceWidth = MediaQuery.of(context).size.width;

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
                            // ignore: no-equal-arguments
                            bottomLeft: _borderRadius,
                          )
                        : BorderRadius.only(
                            topLeft: isLastInMinuteGroup
                                ? _borderRadius
                                : Radius.zero,
                            topRight: _borderRadius,
                            // ignore: no-equal-arguments
                            bottomRight: _borderRadius,
                          )
                    : BorderRadius.zero,
              ),
              constraints: BoxConstraints(
                // todo: refactor
                // ignore: no-magic-number
                maxWidth: deviceWidth * 0.8,
              ),
              child: Padding(
                padding: isHaveTextContent
                    ? const EdgeInsets.symmetric(
                        // todo: refactor
                        // ignore: no-magic-number
                        vertical: 12,
                        // ignore: no-magic-number
                        horizontal: 16,
                      )
                    : EdgeInsets.zero,
                child: isHaveTextContent
                    ? const _ConversationChatStatusListItemBodyWidget()
                    : ClipRRect(
                        borderRadius: isStatusFromMe
                            ? BorderRadius.only(
                                topLeft: _borderRadius,
                                topRight: isLastInMinuteGroup
                                    ? _borderRadius
                                    : Radius.zero,
                                // ignore: no-equal-arguments
                                bottomLeft: _borderRadius,
                              )
                            : BorderRadius.only(
                                topLeft: isLastInMinuteGroup
                                    ? _borderRadius
                                    : Radius.zero,
                                topRight: _borderRadius,
                                // ignore: no-equal-arguments
                                bottomRight: _borderRadius,
                              ),
                        child:
                            const _ConversationChatStatusListItemBodyWidget(),
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
            ),
        ],
      ),
    );
  }
}

class _ConversationChatStatusListItemBodyWidget extends StatelessWidget {
  const _ConversationChatStatusListItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const <Widget>[
          _ConversationChatStatusListItemTextContentWidget(),
          _ConversationChatStatusListItemMediaContentWidget(),
        ],
      );
}

class _ConversationChatStatusListItemMediaContentWidget
    extends StatelessWidget {
  const _ConversationChatStatusListItemMediaContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<List<IUnifediApiMediaAttachment>?>(
      stream: statusBloc.mediaAttachmentsStream,
      builder: (context, snapshot) {
        var mediaAttachments = snapshot.data;

        if (mediaAttachments == null) {
          return const SizedBox.shrink();
        }

        return DisposableProvider<IMediaAttachmentListBloc>(
          create: (context) => MediaAttachmentListBloc(
            mediaAttachments: mediaAttachments,
            initialMediaAttachment: null,
            instanceLocation: InstanceLocation.local,
            remoteInstanceUriOrNull: null,
          ),
          child: const MediaAttachmentListCarouselWidget(),
        );
      },
    );
  }
}

class _ConversationChatStatusListItemTextContentWidget extends StatelessWidget {
  const _ConversationChatStatusListItemTextContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(statusBloc.status);

    return StreamBuilder<EmojiText?>(
      stream: statusBloc.contentWithEmojisStream,
      initialData: statusBloc.contentWithEmojis,
      builder: (context, snapshot) {
        var contentWithEmojis = snapshot.data;

        if (contentWithEmojis?.text.isNotEmpty == true) {
          var fediUiColorTheme = IFediUiColorTheme.of(context);
          var textScaleFactor = MediaQuery.of(context).textScaleFactor;

          return Provider<EmojiText?>.value(
            value: contentWithEmojis,
            child: DisposableProxyProvider<EmojiText?, IHtmlTextBloc>(
              update: (context, emojiText, previous) {
                var htmlTextInputData = HtmlTextInputData(
                  input: emojiText?.text ?? '',
                  emojis: emojiText?.emojis,
                );
                if (previous?.inputData == htmlTextInputData) {
                  return previous!;
                }

                var htmlTextBloc = HtmlTextBloc(
                  inputData: htmlTextInputData,
                  settings: HtmlTextSettings(
                    shrinkWrap: true,
                    color: isStatusFromMe
                        ? fediUiColorTheme.white
                        : fediUiColorTheme.darkGrey,
                    linkColor: isStatusFromMe
                        ? fediUiColorTheme.white
                        : fediUiColorTheme.primary,
                    // todo: refactor
                    // ignore: no-magic-number
                    fontSize: 16.0,
                    // todo: refactor
                    // ignore: no-magic-number
                    lineHeight: 1.5,
                    drawNewLines: false,
                    textMaxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w300,
                    textScaleFactor: textScaleFactor,
                  ),
                );
                htmlTextBloc.linkClickedStream.listen(
                  (url) {
                    UrlHelper.handleUrlClickWithInstanceLocation(
                      context: context,
                      url: url,
                      instanceLocationBloc: statusBloc,
                    );
                  },
                ).disposeWith(htmlTextBloc);

                return htmlTextBloc;
              },
              child: const HtmlTextWidget(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
