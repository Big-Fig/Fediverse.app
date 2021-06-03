import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc_impl.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_carousel_widget.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_widget.dart';
import 'package:fedi/app/status/body/status_body_bloc.dart';
import 'package:fedi/app/status/body/status_body_link_helper.dart';
import 'package:fedi/app/status/collapsible_item/status_collapsible_item_bloc.dart';
import 'package:fedi/app/status/sensitive/nsfw/status_sensitive_nsfw_warning_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/spoiler/status_sensitive_spoiler_warning_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_model.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/chip/fedi_grey_chip.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

const _defaultPadding = FediPadding.horizontalBigPadding;

final _logger = Logger('status_body_widget.dart');

class StatusBodyWidget extends StatelessWidget {
  const StatusBodyWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _StatusBodyChipsWidget(),
        const _StatusBodyChildWithWarningsWidget(),
      ],
    );
  }
}

class _StatusBodyChildWithWarningsWidget extends StatelessWidget {
  const _StatusBodyChildWithWarningsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusSensitiveBloc = IStatusSensitiveBloc.of(context);

    return StreamBuilder<StatusSensitiveWarningState>(
      stream: statusSensitiveBloc.statusWarningStateStream.distinct(),
      builder: (context, snapshot) {
        var statusWarningState =
            snapshot.data ?? statusSensitiveBloc.statusWarningState;

        _logger.finest(
          () => 'StreamBuilder statusWarningState $statusWarningState',
        );

        Widget child;
        if (statusWarningState.containsSpoilerAndDisplayEnabled) {
          child = const _StatusBodyContentWidget(
            showSpoiler: true,
          );
        } else {
          child = const _StatusBodyWithoutContentWidget();
        }

        if (statusWarningState.nsfwSensitiveAndDisplayEnabled) {
          return child;
        } else {
          return StatusSensitiveNsfwWarningOverlayWidget(
            child: child,
          );
        }
      },
    );
  }
}

class _StatusBodyWithoutContentWidget extends StatelessWidget {
  const _StatusBodyWithoutContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const StatusSpoilerWidget(),
          const StatusSensitiveSpoilerWarningOverlayWidget(
            child: _StatusBodyContentWidget(
              showSpoiler: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBodyContentWidget extends StatelessWidget {
  final bool showSpoiler;

  const _StatusBodyContentWidget({
    Key? key,
    required this.showSpoiler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    var statusCollapsibleItemBloc = IStatusCollapsibleItemBloc.of(context);

    var statusBodyBloc = IStatusBodyBloc.of(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: _defaultPadding,
          child: Column(
            children: [
              if (showSpoiler) const StatusSpoilerWidget(),
              const _StatusBodyContentWithEmojisWidget(),
              if (statusBodyBloc.collapsible &&
                  statusCollapsibleItemBloc.isPossibleToCollapse)
                const _StatusBodyCollapsibleButtonWidget(),
              const _StatusBodyCardWidget(),
            ],
          ),
        ),
        if (statusBloc.poll != null) const _StatusBodyPollWidget(),
        if (statusBloc.reblogOrOriginalMediaAttachments?.isNotEmpty == true &&
            (statusBloc.content?.isNotEmpty == true || statusBloc.poll != null))
          const FediSmallVerticalSpacer(),
        const _StatusBodyContentMediaAttachmentsWidget(),
      ],
    );
  }
}

class _StatusBodyContentMediaAttachmentsWidget extends StatelessWidget {
  const _StatusBodyContentMediaAttachmentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    var statusBodyBloc = IStatusBodyBloc.of(context);

    return StreamBuilder<List<IPleromaApiMediaAttachment>?>(
      stream: statusBloc.reblogOrOriginalMediaAttachmentsStream,
      builder: (context, snapshot) {
        var mediaAttachments = snapshot.data;

        if (mediaAttachments?.isNotEmpty == true) {
          return Provider<List<IPleromaApiMediaAttachment>>.value(
            value: mediaAttachments!,
            child: DisposableProxyProvider<List<IPleromaApiMediaAttachment>,
                IMediaAttachmentListBloc>(
              update: (context, value, _) => MediaAttachmentListBloc(
                mediaAttachments: value,
                initialMediaAttachment: statusBodyBloc.initialMediaAttachment,
              ),
              child: const MediaAttachmentListCarouselWidget(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _StatusBodyPollWidget extends StatelessWidget {
  const _StatusBodyPollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IStatusBloc, IPollBloc>(
        update: (context, statusBloc, _) => statusBloc.pollBloc,
        child: PollWidget(),
      );
}

class _StatusBodyCardWidget extends StatelessWidget {
  const _StatusBodyCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<IPleromaApiCard?>(
      stream: statusBloc.reblogOrOriginalCardStream,
      builder: (context, snapshot) {
        var card = snapshot.data;

        if (card == null) {
          return const SizedBox.shrink();
        }

        return Provider<IPleromaApiCard?>.value(
          value: card,
          child: const CardWidget(),
        );
      },
    );
  }
}

class _StatusBodyCollapsibleButtonWidget extends StatelessWidget {
  const _StatusBodyCollapsibleButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusCollapsibleItemBloc = IStatusCollapsibleItemBloc.of(context);

    return Column(
      children: [
        const FediSmallVerticalSpacer(),
        Center(
          child: StreamBuilder<bool>(
            stream: statusCollapsibleItemBloc.isCollapsedStream,
            builder: (context, snapshot) {
              var isCollapsed = snapshot.data ?? true;

              return FediPrimaryFilledTextButtonWithBorder(
                isCollapsed
                    ? S.of(context).app_status_collapsible_action_expand
                    : S.of(context).app_status_collapsible_action_collapse,
                onPressed: () {
                  statusCollapsibleItemBloc.toggleCollapseExpand();
                },
                expanded: false,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StatusBodySpoilerChipWidget extends StatelessWidget {
  const _StatusBodySpoilerChipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: FediSizes.smallPadding),
      child: FediGreyChip(
        label: S.of(context).app_status_spoiler_chip,
      ),
    );
  }
}

class _StatusBodyChipsWidget extends StatelessWidget {
  const _StatusBodyChipsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    final containsNsfw = statusBloc.nsfwSensitive;
    final containsSpoiler = statusBloc.containsSpoiler;

    if (containsNsfw || containsSpoiler) {
      return Padding(
        padding: FediPadding.horizontalBigPadding,
        child: Row(
          children: [
            if (containsNsfw) const _StatusBodyNsfwChipWidget(),
            if (containsSpoiler) const _StatusBodySpoilerChipWidget(),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _StatusBodyNsfwChipWidget extends StatelessWidget {
  const _StatusBodyNsfwChipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: FediSizes.smallPadding),
      child: FediGreyChip(
        label: S.of(context).app_status_nsfw_chip,
      ),
    );
  }
}

void _onLinkTap(
  BuildContext context,
  String url,
) async {
  await handleStatusBodyLinkClick(
    context: context,
    statusBloc: IStatusBloc.of(context, listen: false),
    url: url,
  );
}

class _StatusBodyContentWithEmojisWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisWidget();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<EmojiText?>(
      stream: statusBloc.contentWithEmojisStream.distinct(),
      initialData: statusBloc.contentWithEmojis,
      builder: (context, snapshot) {
        var contentWithEmojis = snapshot.data;

        _logger.finest(() => 'contentWithEmojis $contentWithEmojis');

        if (contentWithEmojis?.text.isNotEmpty == true) {
          return Provider<EmojiText?>.value(
            value: contentWithEmojis,
            child: const _StatusBodyContentWithEmojisCollapsibleWidget(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _StatusBodyContentWithEmojisCollapsibleWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisCollapsibleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    var statusCollapsibleItemBloc = IStatusCollapsibleItemBloc.of(context);

    var statusBodyBloc = IStatusBodyBloc.of(context);
    var collapsible = statusBodyBloc.collapsible;

    _logger.finest(() => 'build collapsible $collapsible '
        'statusBloc ${statusBloc.remoteId}');

    var isNeedCollapse =
        collapsible && statusCollapsibleItemBloc.isPossibleToCollapse;
    const htmlTextWidget = _StatusBodyContentWithEmojisHtmlTextWidget();

    return StreamBuilder<bool>(
      stream: statusCollapsibleItemBloc.isCollapsedStream.distinct(),
      builder: (context, snapshot) {
        var isCollapsed = snapshot.data ?? false;
        if (isCollapsed && isNeedCollapse) {
          return FediFadeShaderMask(
            fadingColor: IFediUiColorTheme.of(context).white,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            onlyEnd: true,
            // todo: refactor
            // ignore: no-magic-number
            fadingPercent: 0.2,
            child: Container(
              // todo: refactor
              // ignore: no-magic-number
              height: 200,
              child: htmlTextWidget,
            ),
          );
        } else {
          return htmlTextWidget;
        }
      },
    );
  }
}

class _StatusBodyContentWithEmojisHtmlTextWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisHtmlTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    var uiSettingsBloc = IUiSettingsBloc.of(context);

    return StreamBuilder<UiSettingsFontSize?>(
      stream: uiSettingsBloc.statusFontSizeStream,
      builder: (context, snapshot) {
        var statusFontSize = snapshot.data;

        if (statusFontSize == null) {
          return const SizedBox.shrink();
        }

        var textStyle = fediUiTextTheme.bigTallDarkGrey;

        switch (statusFontSize) {
          case UiSettingsFontSize.smallest:
            textStyle = fediUiTextTheme.smallTallDarkGrey;
            break;
          case UiSettingsFontSize.small:
            textStyle = fediUiTextTheme.mediumTallDarkGrey;
            break;
          case UiSettingsFontSize.medium:
            textStyle = fediUiTextTheme.bigTallDarkGrey;
            break;
          case UiSettingsFontSize.large:
            textStyle = fediUiTextTheme.subHeaderTallDarkGrey;
            break;
          case UiSettingsFontSize.largest:
            textStyle = fediUiTextTheme.headerDarkGrey;
            break;
        }

        return DisposableProxyProvider<EmojiText?, IHtmlTextBloc>(
          update: (context, contentWithEmojis, previous) {
            var htmlTextInputData = HtmlTextInputData(
              input: contentWithEmojis?.text ?? '',
              emojis: contentWithEmojis?.emojis,
            );
            if (previous?.inputData == htmlTextInputData) {
              return previous!;
            }

            var htmlTextBloc = HtmlTextBloc(
              inputData: htmlTextInputData,
              settings: HtmlTextSettings(
                color: textStyle.color,
                lineHeight: textStyle.height,
                fontSize: textStyle.fontSize,
                // todo: 1000 is hack, actually it should be null, but dont
                //  work as expected
                // ignore: no-magic-number
                textMaxLines: 1000,
                textOverflow: TextOverflow.ellipsis,
                linkColor: fediUiColorTheme.primary,
                textScaleFactor: textScaleFactor,
                fontWeight: FontWeight.normal,
                drawNewLines: false,
              ),
            );
            htmlTextBloc.addDisposable(
              streamSubscription: htmlTextBloc.linkClickedStream.listen(
                (url) {
                  _onLinkTap(context, url);
                },
              ),
            );

            return htmlTextBloc;
          },
          child: const HtmlTextWidget(),
        );
      },
    );
  }
}
