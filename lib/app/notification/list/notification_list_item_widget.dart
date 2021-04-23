import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/notification/created_at/notification_created_at_widget.dart';
import 'package:fedi/app/notification/go_to_notification_extension.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("notification_list_item_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  const NotificationListItemWidget();

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    var bodyWidget = const _NotificationListItemBodyWidget();
    return StreamBuilder<bool?>(
      stream: notificationBloc.dismissedStream,
      builder: (context, snapshot) {
        var dismissed = snapshot.data;
        if (dismissed == true) {
          return Stack(
            children: [
              bodyWidget,
              Positioned.fill(
                child: const _NotificationListItemBodyDismissedWidget(),
              ),
            ],
          );
        } else {
          return bodyWidget;
        }
      },
    );
  }
}

class _NotificationListItemBodyDismissedWidget extends StatelessWidget {
  const _NotificationListItemBodyDismissedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediBlurredOverlayWarningWidget(
      descriptionText: S.of(context).app_notification_dismissed,
    );
  }
}

class _NotificationListItemBodyWidget extends StatelessWidget {
  const _NotificationListItemBodyWidget();

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);

    return DisposableProxyProvider<INotificationBloc, IAccountBloc>(
      update: (context, value, previous) => LocalAccountBloc.createFromContext(
        context,
        account: value.account!,
        isNeedWatchWebSocketsEvents: false,
        isNeedRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates: false,
        isNeedPreFetchRelationship: false,
      ),
      child: StreamBuilder<NotificationState>(
        stream: notificationBloc.stateStream,
        builder: (context, snapshot) {
          var notificationState = snapshot.data;
          var unread = notificationState?.unread ?? true;
          var dismissed = notificationState?.dismissed ?? false;
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            // ignore: no-magic-number
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              if (unread == true)
                const _NotificationListItemBodyMarkAsReadActionWidget(),
              if (dismissed != true)
                const _NotificationListItemBodyDismissActionWidget(),
            ],
            child: const _NotificationListItemBodySlidableChildWidget(),
          );
        },
      ),
    );
  }
}

class _NotificationListItemBodyDismissActionWidget extends StatelessWidget {
  const _NotificationListItemBodyDismissActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);
    return IconSlideAction(
      icon: FediIcons.delete,
      caption: S.of(context).app_notification_action_dismiss,
      color: IFediUiColorTheme.of(context).white,
      onTap: () {
        notificationBloc.dismiss();
      },
    );
  }
}

class _NotificationListItemBodyMarkAsReadActionWidget extends StatelessWidget {
  const _NotificationListItemBodyMarkAsReadActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);
    return IconSlideAction(
      icon: FediIcons.check,
      caption: S.of(context).app_notification_action_markAsRead,
      color: IFediUiColorTheme.of(context).white,
      onTap: () {
        notificationBloc.markAsRead();
      },
    );
  }
}

class _NotificationListItemBodySlidableChildWidget extends StatelessWidget {
  const _NotificationListItemBodySlidableChildWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);

    return StreamBuilder<bool?>(
      stream: notificationBloc.unreadStream,
      builder: (context, snapshot) {
        var unread = snapshot.data ?? true;
        return Opacity(
          // ignore: no-magic-number
          opacity: unread ? 1.0 : 0.6,
          child: const _NotificationListItemBodySlidableChildContentWidget(),
        );
      },
    );
  }
}

class _NotificationListItemBodySlidableChildContentWidget
    extends StatelessWidget {
  const _NotificationListItemBodySlidableChildContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: FediSizes.bigPadding,
        vertical: FediSizes.bigPadding + FediSizes.smallPadding,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const _NotificationListItemAvatarWidget(),
              const FediBigHorizontalSpacer(),
              const Expanded(
                child: _NotificationListItemBodyMainAreaWidget(),
              ),
              const FediBigHorizontalSpacer(),
              const _NotificationListItemCreatedAtWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationListItemBodyMainAreaWidget extends StatelessWidget {
  const _NotificationListItemBodyMainAreaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onNotificationClick(context);
      },
      onLongPress: () {
        _onNotificationLongPress(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const _NotificationListItemAccountDisplayNameWidget(),
          Row(
            children: [
              const _NotificationListItemIconWidget(),
              const Expanded(
                child: _NotificationListItemContentWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onNotificationClick(BuildContext context) async {
    var notificationBloc = INotificationBloc.of(context, listen: false);

    await notificationBloc.notification.goToRelatedPage(context);
  }

  void _onNotificationLongPress(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: false);

    showFediModalBottomSheetDialog(
      context: context,
      child: FediChooserDialogBody(
        title: S.of(context).app_notification_action_popup_title,
        actions: [
          if (notificationBloc.unread == true)
            DialogAction(
              icon: FediIcons.check,
              label: S.of(context).app_notification_action_markAsRead,
              onAction: (context) {
                notificationBloc.markAsRead();
                Navigator.of(context).pop();
              },
            ),
          if (notificationBloc.dismissed != true)
            DialogAction(
              icon: FediIcons.delete,
              label: S.of(context).app_notification_action_dismiss,
              onAction: (context) {
                notificationBloc.dismiss();
                Navigator.of(context).pop();
              },
            ),
        ],
        cancelable: true,
      ),
    );
  }
}

class _NotificationListItemContentWidget extends StatelessWidget {
  const _NotificationListItemContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);

    var rawText = _mapToRawText(context, notificationBloc);

    var emojis = notificationBloc.status?.emojis;
    return Provider<EmojiText>.value(
      value: EmojiText(text: rawText, emojis: emojis),
      child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
        update: (context, emojiText, _) {
          HtmlTextBloc htmlTextBloc = _createHtmlTextBloc(context, emojiText);
          return htmlTextBloc;
        },
        child: const HtmlTextWidget(),
      ),
    );
  }

  String _mapToRawText(
    BuildContext context,
    INotificationBloc notificationBloc,
  ) {
    String rawText;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        rawText = S.of(context).app_notification_header_follow;
        break;
      case PleromaNotificationType.favourite:
        rawText = S.of(context).app_notification_header_favourite;
        break;
      case PleromaNotificationType.reblog:
        rawText = S.of(context).app_notification_header_reblog;
        break;
      case PleromaNotificationType.mention:
        rawText = S.of(context).app_notification_header_mention(
              _extractStatusRawContent(notificationBloc)!,
            );
        break;
      case PleromaNotificationType.poll:
        rawText = S.of(context).app_notification_header_poll;
        break;
      case PleromaNotificationType.move:
        rawText = S.of(context).app_notification_header_move;
        break;
      case PleromaNotificationType.followRequest:
        rawText = S.of(context).app_notification_header_followRequest;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        rawText = S.of(context).app_notification_header_pleromaEmojiReaction(
              notificationBloc.notification.emoji!,
            );
        break;
      case PleromaNotificationType.pleromaChatMention:
        rawText = S.of(context).app_notification_header_pleromaChatMention(
              _extractChatMessageRawContent(notificationBloc)!,
            );
        break;
      case PleromaNotificationType.pleromaReport:
        rawText = S.of(context).app_notification_header_report(
              notificationBloc.account?.acct ?? "",
            );
        break;
      case PleromaNotificationType.unknown:
        var isHaveStatus = notificationBloc.status != null;
        String? statusText;
        if (isHaveStatus) {
          statusText = _extractStatusRawContent(notificationBloc);
        } else {
          statusText = "";
        }

        var isHaveEmoji = notificationBloc.notification.emoji != null;
        String? emojiText;
        if (isHaveEmoji) {
          emojiText = notificationBloc.notification.emoji;
        } else {
          emojiText = "";
        }
        rawText = S.of(context).app_notification_header_unknown(
              "${notificationBloc.type}: $emojiText $statusText",
            );
        break;
    }
    return rawText;
  }

  HtmlTextBloc _createHtmlTextBloc(BuildContext context, EmojiText emojiText) {
    var fediUiColorTheme = IFediUiColorTheme.of(
      context,
      listen: false,
    );
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var htmlTextBloc = HtmlTextBloc(
      inputData: HtmlTextInputData(
        input: emojiText.text,
        emojis: emojiText.emojis,
      ),
      settings: HtmlTextSettings(
        // ignore: no-magic-number
        textMaxLines: 3,
        textOverflow: TextOverflow.ellipsis,
        color: fediUiColorTheme.mediumGrey,
        // todo: refactor
        // ignore: no-magic-number
        fontSize: 14,
        // todo: refactor
        // ignore: no-magic-number
        lineHeight: 1.5,
        fontWeight: FontWeight.w300,
        shrinkWrap: true,
        linkColor: fediUiColorTheme.primary,
        drawNewLines: false,
        textScaleFactor: textScaleFactor,
      ),
    );
    return htmlTextBloc;
  }

  String? _extractStatusRawContent(INotificationBloc notificationBloc) {
    var content = notificationBloc.status?.content;

    if (content != null) {
      content = content.extractRawStringFromHtmlString();
      var mediaAttachments =
          notificationBloc.notification.status?.mediaAttachments;
      if (content.isEmpty && mediaAttachments?.isNotEmpty == true) {
        content = mediaAttachments!
            .map(
              (mediaAttachment) =>
                  mediaAttachment.description ?? mediaAttachment.url,
            )
            .join(", ");
      }
    }

    return content;
  }

  String? _extractChatMessageRawContent(INotificationBloc notificationBloc) {
    var content = notificationBloc.chatMessage?.content;

    if (content != null) {
      content = content.extractRawStringFromHtmlString();
      var mediaAttachment =
          notificationBloc.notification.chatMessage?.mediaAttachment;
      if (mediaAttachment != null) {
        content = mediaAttachment.description ?? mediaAttachment.url;
      }
    }

    return content;
  }
}

class _NotificationListItemAccountDisplayNameWidget extends StatelessWidget {
  const _NotificationListItemAccountDisplayNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountDisplayNameWidget(
      textStyle: IFediUiTextTheme.of(context).bigTallDarkGrey,
    );
  }
}

class _NotificationListItemIconWidget extends StatelessWidget {
  const _NotificationListItemIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData? iconData;
    var notificationBloc = INotificationBloc.of(context);
    Color iconColor = IFediUiColorTheme.of(context).primary;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        iconData = FediIcons.follow;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.favourite:
        iconData = FediIcons.heart_active;
        iconColor = IFediUiColorTheme.of(context).secondary;
        break;
      case PleromaNotificationType.reblog:
        iconData = FediIcons.reply;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.mention:
        iconData = null;
        break;
      case PleromaNotificationType.poll:
        iconData = FediIcons.poll;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.move:
        iconData = FediIcons.forward;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.pleromaReport:
        iconData = FediIcons.report;
        iconColor = IFediUiColorTheme.of(context).error;
        break;
      case PleromaNotificationType.followRequest:
        iconData = FediIcons.add_user;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        iconData = null;
        break;
      case PleromaNotificationType.pleromaChatMention:
        iconData = FediIcons.chat;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.unknown:
        iconData = null;
        break;
    }

    if (iconData != null) {
      return Padding(
        padding: const EdgeInsets.only(right: FediSizes.smallPadding),
        child: Icon(
          iconData,
          color: iconColor,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _NotificationListItemAvatarWidget extends StatelessWidget {
  const _NotificationListItemAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);
    return InkWell(
      onTap: () {
        goToLocalAccountDetailsPage(
          context,
          account: notificationBloc.account!,
        );
      },
      child: const AccountAvatarWidget(
        progressSize: FediSizes.accountAvatarProgressDefaultSize,
        imageSize: FediSizes.accountAvatarDefaultSize,
      ),
    );
  }
}

class _NotificationListItemCreatedAtWidget extends StatelessWidget {
  const _NotificationListItemCreatedAtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<bool?>(
      stream: notificationBloc.unreadStream,
      initialData: notificationBloc.unread,
      builder: (context, snapshot) {
        var unread = snapshot.data!;
        return NotificationCreatedAtWidget(
          textStyle: unread
              ? fediUiTextTheme.smallShortPrimaryDark
              : fediUiTextTheme.smallShortGrey,
        );
      },
    );
  }
}
