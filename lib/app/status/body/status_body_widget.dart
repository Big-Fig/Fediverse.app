import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc_impl.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_carousel_widget.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_widget.dart';
import 'package:fedi/app/status/body/status_body_bloc.dart';
import 'package:fedi/app/status/body/status_body_link_helper.dart';
import 'package:fedi/app/status/nsfw/status_nsfw_warning_overlay_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_warning_overlay_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/chip/fedi_grey_chip.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

const _defaultPadding = FediPadding.horizontalBigPadding;

final _logger = Logger("status_body_widget.dart");

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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context);
    return StreamBuilder<StatusWarningState>(
        stream: statusBloc.statusWarningStateStream.distinct(),
        builder: (context, snapshot) {
          var statusWarningState = snapshot.data;

          _logger.finest(
              () => "StreamBuilder statusWarningState $statusWarningState");

          if (statusWarningState == null) {
            return const SizedBox.shrink();
          }

          Widget child;
          // todo: remove temp hack
          var alreadyClickedShowContent = statusWarningState.nsfwSensitive;
          if (statusWarningState.containsSpoilerAndDisplayEnabled ||
              alreadyClickedShowContent) {
            child = const _StatusBodyContentWidget(
              showSpoiler: true,
            );
          } else {
            child = const _StatusBodyWithoutContentWidget();
          }

          if (statusWarningState.nsfwSensitiveAndDisplayNsfwContentEnabled) {
            return child;
          } else {
            return StatusNsfwWarningOverlayWidget(
              child: child,
            );
          }
        });
  }
}

class _StatusBodyWithoutContentWidget extends StatelessWidget {
  const _StatusBodyWithoutContentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const StatusSpoilerWidget(),
          const StatusSpoilerWarningOverlayWidget(
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
    Key key,
    @required this.showSpoiler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    var statusBodyBloc = IStatusBodyBloc.of(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: _defaultPadding,
          child: Column(
            children: [
              if (showSpoiler) const StatusSpoilerWidget(),
              const _StatusBodyContentWithEmojisWidget(),
              if (statusBodyBloc.collapsible && statusBloc.isPossibleToCollapse)
                const _StatusBodyCollapsibleButtonWidget(),
              const _StatusBodyCardWidget(),
            ],
          ),
        ),
        if (statusBloc.poll != null) const _StatusBodyPollWidget(),
        if (statusBloc.mediaAttachments?.isNotEmpty == true &&
            (statusBloc.content?.isNotEmpty == true || statusBloc.poll != null))
          const FediSmallVerticalSpacer(),
        const _StatusBodyContentMediaAttachmentsWidget(),
      ],
    );
  }
}

class _StatusBodyContentMediaAttachmentsWidget extends StatelessWidget {
  const _StatusBodyContentMediaAttachmentsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    var statusBodyBloc = IStatusBodyBloc.of(context);
    return StreamBuilder<List<IPleromaMediaAttachment>>(
      stream: statusBloc.mediaAttachmentsStream,
      builder: (context, snapshot) {
        var mediaAttachments = snapshot.data;

        if (mediaAttachments?.isNotEmpty == true) {
          return DisposableProvider<IMediaAttachmentListBloc>(
            create: (context) => MediaAttachmentListBloc(
              mediaAttachments: snapshot.data,
              initialMediaAttachment: statusBodyBloc.initialMediaAttachment,
            ),
            child: const MediaAttachmentListCarouselWidget(),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class _StatusBodyPollWidget extends StatelessWidget {
  const _StatusBodyPollWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IStatusBloc, IPollBloc>(
        update: (context, statusBloc, _) => statusBloc.pollBloc,
        child: PollWidget(),
      );
}

class _StatusBodyCardWidget extends StatelessWidget {
  const _StatusBodyCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    return StreamBuilder<IPleromaCard>(
        stream: statusBloc.reblogOrOriginalCardStream,
        builder: (context, snapshot) {
          var card = snapshot.data;

          if (card == null) {
            return const SizedBox.shrink();
          }
          return Provider.value(
            value: card,
            child: const CardWidget(),
          );
        });
  }
}

class _StatusBodyCollapsibleButtonWidget extends StatelessWidget {
  const _StatusBodyCollapsibleButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    return Center(
      child: StreamBuilder<bool>(
        stream: statusBloc.isCollapsedStream,
        builder: (context, snapshot) {
          var isCollapsed = snapshot.data ?? true;
          return FediPrimaryFilledTextButton(
            isCollapsed
                ? S.of(context).app_status_collapsible_action_expand
                : S.of(context).app_status_collapsible_action_collapse,
            onPressed: () {
              statusBloc.toggleCollapseExpand();
            },
          );
        },
      ),
    );
  }
}

class _StatusBodySpoilerChipWidget extends StatelessWidget {
  const _StatusBodySpoilerChipWidget({
    Key key,
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
    Key key,
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
    Key key,
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
    link: url,
  );
}

class _StatusBodyContentWithEmojisWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisWidget();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<String>(
        stream: statusBloc.contentWithEmojisStream.distinct(),
        builder: (context, snapshot) {
          var contentWithEmojis = snapshot.data;

          _logger.finest(() => "contentWithEmojis $contentWithEmojis");

          if (contentWithEmojis?.isNotEmpty == true) {
            return Provider<String>.value(
              value: contentWithEmojis,
              child: _StatusBodyContentWithEmojisCollapsibleWidget(),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _StatusBodyContentWithEmojisCollapsibleWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisCollapsibleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    var statusBodyBloc = IStatusBodyBloc.of(context);
    var collapsible = statusBodyBloc.collapsible;

    _logger.finest(() => "build collapsible $collapsible "
        "statusBloc ${statusBloc.remoteId}");

    var isNeedCollapse = collapsible && statusBloc.isPossibleToCollapse;
    const htmlTextWidget = _StatusBodyContentWithEmojisHtmlTextWidget();
    return StreamBuilder<bool>(
        stream: statusBloc.isCollapsedStream.distinct(),
        builder: (context, snapshot) {
          var isCollapsed = snapshot.data ?? false;
          if (isCollapsed && isNeedCollapse) {
            return Container(
              height: 200,
              child: htmlTextWidget,
            );
          } else {
            return htmlTextWidget;
          }
        });
  }
}

class _StatusBodyContentWithEmojisHtmlTextWidget extends StatelessWidget {
  const _StatusBodyContentWithEmojisHtmlTextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contentWithEmojisEmojis = Provider.of<String>(context);
    return HtmlTextWidget(
      htmlData: contentWithEmojisEmojis,
      lineHeight: 1.5,
      fontSize: 16.0,
      // todo: 1000 is hack, actually it should be null, but don't
      //  work as expected
      textMaxLines: 1000,
      textOverflow: TextOverflow.ellipsis,
      onLinkTap: _onLinkTap,
    );
  }
}
