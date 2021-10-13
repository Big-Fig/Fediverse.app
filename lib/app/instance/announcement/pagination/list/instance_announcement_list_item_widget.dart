import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_list_widget.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

final _dateFormat = DateFormat('dd MMM, HH:mm a');

class InstanceAnnouncementListItemWidget extends StatelessWidget {
  const InstanceAnnouncementListItemWidget();

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceAnnouncementBloc.readStream,
      initialData: instanceAnnouncementBloc.read,
      builder: (context, snapshot) {
        var read = snapshot.data!;

        return Opacity(
          // ignore: no-magic-number
          opacity: read ? 0.6 : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: FediSizes.bigPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _InstanceAnnouncementListItemUpdatedAtWidget(),
                    Row(
                      children: [
                        const _InstanceAnnouncementListItemDismissButtonWidget(),
                        const _InstanceAnnouncementListItemAddEmojiButtonWidget(),
                      ],
                    ),
                  ],
                ),
              ),
              const FediUltraLightGreyDivider(),
              Padding(
                padding: const EdgeInsets.all(FediSizes.bigPadding),
                child: Column(
                  children: [
                    const _InstanceAnnouncementListItemContentWidget(),
                    const InstanceAnnouncementEmojiReactionListWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InstanceAnnouncementListItemUpdatedAtWidget extends StatelessWidget {
  const _InstanceAnnouncementListItemUpdatedAtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);

    return StreamBuilder<DateTime>(
      stream: instanceAnnouncementBloc.updatedAtStream,
      initialData: instanceAnnouncementBloc.updatedAt,
      builder: (context, snapshot) {
        var draftAt = snapshot.data!;

        return Text(
          _dateFormat.format(draftAt),
          style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
        );
      },
    );
  }
}

class _InstanceAnnouncementListItemAddEmojiButtonWidget
    extends StatelessWidget {
  const _InstanceAnnouncementListItemAddEmojiButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          FediIcons.emoji,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        onPressed: () {
          _showEmojiPicker(context);
        },
      );
}

void _showEmojiPicker(BuildContext context) {
  var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(
    context,
    listen: false,
  );
  showEmojiPickerModalPopup(
    context,
    emojiReactionSelectedCallback: (
      context,
      String emojiName,
      String emoji,
    ) {
      PleromaAsyncOperationHelper.performPleromaAsyncOperation(
        context: context,
        asyncCode: () => instanceAnnouncementBloc.toggleEmojiReaction(
          emojiName: emoji,
        ),
      );
    },
  );
}

class _InstanceAnnouncementListItemDismissButtonWidget extends StatelessWidget {
  const _InstanceAnnouncementListItemDismissButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceAnnouncementBloc.readStream,
      initialData: instanceAnnouncementBloc.read,
      builder: (context, snapshot) {
        var read = snapshot.data!;

        if (read) {
          return const SizedBox.shrink();
        } else {
          return FediIconButton(
            icon: Icon(
              FediIcons.check,
              color: IFediUiColorTheme.of(context).darkGrey,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context,
                asyncCode: () async {
                  await instanceAnnouncementBloc.dismiss();
                },
              );
            },
          );
        }
      },
    );
  }
}

class _InstanceAnnouncementListItemContentWidget extends StatelessWidget {
  const _InstanceAnnouncementListItemContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    var textStyle = fediUiTextTheme.bigTallDarkGrey;

    return DisposableProxyProvider<IInstanceAnnouncement, IHtmlTextBloc>(
      update: (context, value, previous) {
        var htmlTextInputData = HtmlTextInputData(
          input: value.content,
          emojis: null,
        );

        if (previous?.inputData == htmlTextInputData) {
          return previous!;
        } else {
          return HtmlTextBloc(
            inputData: htmlTextInputData,
            settings: HtmlTextSettings(
              color: textStyle.color,
              lineHeight: textStyle.height,
              fontSize: textStyle.fontSize,
              textOverflow: TextOverflow.ellipsis,
              linkColor: fediUiColorTheme.primary,
              fontWeight: FontWeight.normal,
              drawNewLines: false,
              textMaxLines: null,
              textScaleFactor: 1.0,
            ),
          );
        }
      },
      child: const HtmlTextWidget(),
    );
  }
}
