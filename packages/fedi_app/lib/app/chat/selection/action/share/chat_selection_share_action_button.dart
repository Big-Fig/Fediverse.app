import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/chat/conversation/share/conversation_chat_share_entity_page.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/share/unifedi_chat_share_entity_page.dart';
import 'package:fedi_app/app/html/html_text_helper.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi_app/app/share/entity/share_entity_model.dart';
import 'package:fedi_app/app/share/external/external_share_entity_page.dart';
import 'package:fedi_app/app/share/share_chooser_dialog.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ChatSelectionShareActionButtonWidget extends StatelessWidget {
  const ChatSelectionShareActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) {
    var instanceLocation = InstanceLocation.local;
    var mediaAttachmentReuploadService = IMediaAttachmentReuploadService.of(
      context,
      listen: false,
    );

    return FediIconButton(
      icon: const Icon(FediIcons.share),
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () async {
        var chatSelectionBloc = IChatSelectionBloc.of(context, listen: false);
        var currentSelection = chatSelectionBloc.currentSelection;
        await showShareChooserDialog(
          context,
          externalShareAction: (context) {
            Navigator.of(context).pop();

            goToExternalShareEntityPage(
              context: context,
              shareEntity: _mapCurrentSelectionToShareEntity(currentSelection),
              instanceLocation: instanceLocation,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationChatShareEntityPage(
              context: context,
              shareEntity: _mapCurrentSelectionToShareEntity(currentSelection),
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToUnifediChatShareEntityPage(
              context: context,
              shareEntity: _mapCurrentSelectionToShareEntity(currentSelection),
              instanceLocation: instanceLocation,
            );
          },
          newStatusShareAction: (context) async {
            var rawText = chatSelectionBloc.calculateSelectionAsRawText();
            var mediaAttachments =
                chatSelectionBloc.calculateSelectionAsMediaAttachments();

            var originalMediaAttachments = mediaAttachments;
            List<IUnifediApiMediaAttachment>? reuploadedMediaAttachments;

            if (originalMediaAttachments?.isNotEmpty == true) {
              var dialogResult = await UnifediAsyncOperationHelper
                  .performUnifediAsyncOperation<
                      List<IUnifediApiMediaAttachment>>(
                context: context,
                asyncCode: () async {
                  var futures = originalMediaAttachments!.map(
                    (mediaAttachment) =>
                        mediaAttachmentReuploadService.reuploadMediaAttachment(
                      originalMediaAttachment: mediaAttachment,
                    ),
                  );

                  return Future.wait(futures);
                },
              );

              reuploadedMediaAttachments = dialogResult.result;
            }

            if (originalMediaAttachments?.length ==
                reuploadedMediaAttachments?.length) {
              goToNewPostStatusPageWithInitial(
                context,
                initialText: rawText,
                initialMediaAttachments: reuploadedMediaAttachments
                    ?.toUnifediApiMediaAttachmentList(),
              );
              // Future.delayed(Duration(milliseconds: 1000), () {
              // });
            }
          },
        );

        chatSelectionBloc.clearSelection();
      },
    );
  }
}

ShareEntity _mapCurrentSelectionToShareEntity(
  List<IChatMessage> currentSelection,
) =>
    ShareEntity(
      items: currentSelection
          .map(
            (chatMessage) => ShareEntityItem(
              createdAt: chatMessage.createdAt,
              fromAccount: chatMessage.account,
              text: chatMessage.content?.extractRawStringFromHtmlString(),
              mediaAttachments: chatMessage.mediaAttachments,
              mediaLocalFiles: null,
              isNeedReUploadMediaAttachments: true,
              linkToOriginal: null,
            ),
          )
          .toList(),
    );
