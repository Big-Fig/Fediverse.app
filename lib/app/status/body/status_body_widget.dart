import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_widget.dart';
import 'package:fedi/app/status/content/status_content_with_emojis_widget.dart';
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
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

const _defaultPadding = FediPadding.horizontalBigPadding;

final _logger = Logger("status_body_widget.dart");

class StatusBodyWidget extends StatelessWidget {
  final bool collapsible;
  final IPleromaMediaAttachment initialMediaAttachment;

  StatusBodyWidget({
    @required this.collapsible,
    @required this.initialMediaAttachment,
  });

  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context, listen: false);
    return Column(
      children: [
        buildChips(context, statusBloc),
        StreamBuilder<StatusWarningState>(
            stream: statusBloc.statusWarningStateStream.distinct(),
            initialData: statusBloc.statusWarningState,
            builder: (context, snapshot) {
              var statusWarningState = snapshot.data;

              _logger.finest(
                  () => "StreamBuilder statusWarningState $statusWarningState");

              var containsSpoilerAndDisplayEnabled =
                  statusWarningState.containsSpoiler != true ||
                      statusWarningState.displayContainsSpoiler;

              var nsfwSensitiveAndDisplayNsfwContentEnabled =
                  statusWarningState.nsfwSensitive != true ||
                      statusWarningState.displayNsfwSensitive;

              Widget child;
              // todo: remove temp hack
              var alreadyClickedShowContent = statusWarningState.nsfwSensitive;
              if (containsSpoilerAndDisplayEnabled ||
                  alreadyClickedShowContent) {
                child = buildStatusBodyWidget(context, statusBloc);
              } else {
                child = buildSpoilerWithoutBodyWidget(context, statusBloc);
              }

              if (nsfwSensitiveAndDisplayNsfwContentEnabled) {
                return child;
              } else {
                return StatusNsfwWarningOverlayWidget(
                  child: child,
                );
              }
            }),
        // StreamBuilder<bool>(
        //     stream: statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabledStream
        //         .distinct(),
        //     initialData: statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled,
        //     builder: (context, snapshot) {
        //       var nsfwSensitiveAndDisplayNsfwContentEnabled = snapshot.data;
        //
        //       _logger.finest(() =>
        //           "StreamBuilder nsfwSensitiveAndDisplayNsfwContentEnabled $nsfwSensitiveAndDisplayNsfwContentEnabled");
        //
        //       var child = StreamBuilder<bool>(
        //           stream: statusBloc
        //               .containsSpoilerAndDisplaySpoilerContentEnabledStream
        //               .distinct(),
        //           initialData:
        //               statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled,
        //           builder: (context, snapshot) {
        //             var containsSpoilerAndDisplayEnabled = snapshot.data;
        //
        //             _logger.finest(() =>
        //                 "StreamBuilder containsSpoilerAndDisplayEnabled $containsSpoilerAndDisplayEnabled");
        //             // todo: remove temp hack
        //             var alreadyClickedShowContent = statusBloc.nsfwSensitive;
        //             if (containsSpoilerAndDisplayEnabled ||
        //                 alreadyClickedShowContent) {
        //               return buildStatusBodyWidget(context, statusBloc);
        //             } else {
        //               return buildSpoilerWithoutBodyWidget(context, statusBloc);
        //             }
        //           });
        //       if (nsfwSensitiveAndDisplayNsfwContentEnabled) {
        //         return child;
        //       } else {
        //         return StatusNsfwWarningOverlayWidget(
        //           child: child,
        //         );
        //       }
        //     }),
      ],
    );
  }

  Widget buildStatusBodyWidget(
    BuildContext context,
    IStatusBloc statusBloc, {
    bool showSpoiler = true,
  }) {
    _logger.finest(() => "buildStatusBodyWidget showSpoiler $showSpoiler");
    return Column(
      children: <Widget>[
        Padding(
          padding: _defaultPadding,
          child: Column(
            children: [
              if (showSpoiler) StatusSpoilerWidget(),
              collapsible
                  ? const StatusContentWithEmojisWidget(
                      collapsible: true,
                    )
                  : const StatusContentWithEmojisWidget(
                      collapsible: false,
                    ),
              if (collapsible && statusBloc.isPossibleToCollapse)
                buildCollapsibleButton(context, statusBloc),
              StreamBuilder<IPleromaCard>(
                  stream: statusBloc.reblogOrOriginalCardStream,
                  initialData: statusBloc.reblogOrOriginalCard,
                  builder: (context, snapshot) {
                    var card = snapshot.data;

                    if (card == null) {
                      return SizedBox.shrink();
                    }
                    return Provider.value(value: card, child: CardWidget());
                  }),
            ],
          ),
        ),
        if (statusBloc.poll != null)
          Provider<IPollBloc>.value(
            value: statusBloc.pollBloc,
            child: PollWidget(),
          ),
        if (statusBloc.mediaAttachments?.isNotEmpty == true &&
            (statusBloc.content?.isNotEmpty == true || statusBloc.poll != null))
          FediSmallVerticalSpacer(),
        StreamBuilder<List<IPleromaMediaAttachment>>(
            stream: statusBloc.mediaAttachmentsStream,
            initialData: statusBloc.mediaAttachments,
            builder: (context, snapshot) {
              var mediaAttachments = snapshot.data;

              if (mediaAttachments?.isNotEmpty == true) {
                return MediaAttachmentsWidget(
                  mediaAttachments: snapshot.data,
                  initialMediaAttachment: initialMediaAttachment,
                );
              } else {
                return SizedBox.shrink();
              }
            }),
      ],
    );
  }

  Widget buildSpoilerWithoutBodyWidget(
          BuildContext context, IStatusBloc statusBloc) =>
      Padding(
        padding: _defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StatusSpoilerWidget(),
            StatusSpoilerWarningOverlayWidget(
              child: buildStatusBodyWidget(context, statusBloc,
                  showSpoiler: false),
            ),
          ],
        ),
      );

  Widget buildCollapsibleButton(BuildContext context, IStatusBloc statusBloc) =>
      Center(
          child: StreamBuilder<bool>(
              stream: statusBloc.isCollapsedStream,
              initialData: statusBloc.isCollapsed,
              builder: (context, snapshot) {
                var isCollapsed = snapshot.data;
                return FediPrimaryFilledTextButton(
                  isCollapsed
                      ? tr("app.status.collapsible.action.expand")
                      : tr("app.status.collapsible.action.collapse"),
                  onPressed: () {
                    statusBloc.toggleCollapseExpand();
                  },
                );
              }));

  Widget buildChips(BuildContext context, IStatusBloc statusBloc) {
    final containsNsfw = statusBloc.nsfwSensitive;
    final containsSpoiler = statusBloc.containsSpoiler;

    if (containsNsfw || containsSpoiler) {
      return Padding(
        padding: FediPadding.horizontalBigPadding,
        child: Row(
          children: [
            if (containsNsfw)
              Padding(
                padding: EdgeInsets.only(right: FediSizes.smallPadding),
                child: FediGreyChip(
                  label: "app.status.nsfw.chip".tr(),
                ),
              ),
            if (containsSpoiler)
              Padding(
                padding: EdgeInsets.only(right: FediSizes.smallPadding),
                child: FediGreyChip(
                  label: "app.status.spoiler.chip".tr(),
                ),
              ),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
