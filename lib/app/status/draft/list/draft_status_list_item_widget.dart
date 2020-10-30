import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/draft/draft_edit_post_status_page.dart';
import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateFormat = DateFormat("dd MMM, HH:mm a");

class DraftStatusListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context, listen: true);

    return Column(
      children: <Widget>[
        buildDraftHeader(context, draftStatusBloc),
        const FediUltraLightGreyDivider(),
        StreamBuilder<IDraftStatus>(
            stream: draftStatusBloc.draftStatusStream,
            initialData: draftStatusBloc.draftStatus,
            builder: (context, snapshot) {
              var draftStatus = snapshot.data;
              return Provider.value(
                value: draftStatus,
                child: ProxyProvider<IDraftStatus, IStatus>(
                    update: (context, value, previous) =>
                        DraftStatusAdapterToStatus(
                            draftStatus: value,
                            account: IMyAccountBloc.of(context, listen: false)
                                .account),
                    child: const StatusListItemTimelineWidget.list(
                      displayActions: false,
                      statusCallback: null,
                      collapsible: false,
                      initialMediaAttachment: null,
                    )),
              );
            }),
        const FediSmallVerticalSpacer(),
      ],
    );
  }

  Widget buildDraftHeader(
      BuildContext context, IDraftStatusBloc draftStatusBloc) {
    return StreamBuilder<DraftStatusState>(
        stream: draftStatusBloc.stateStream,
        initialData: draftStatusBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;

          switch (state) {
            case DraftStatusState.draft:
              return Padding(
                padding: FediPadding.horizontalSmallPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildDraftAt(context, draftStatusBloc),
                    Row(
                      children: [
                        buildEditButton(context, draftStatusBloc),
                        buildCancelButton(context, draftStatusBloc),
                      ],
                    )
                  ],
                ),
              );
              break;
            case DraftStatusState.canceled:
              return Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: FediPadding.allSmallPadding,
                        child: Text(
                           S.of(context).app_status_draft_state_canceled,
                          style: IFediUiTextTheme.of(context)
                              .mediumShortBoldDarkGrey,
                        ),
                      )
                    ],
                  ));
              break;
            case DraftStatusState.alreadyPosted:
              return Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: FediPadding.allSmallPadding,
                        child: Text(
                          S.of(context).app_status_draft_state_alreadyPosted,
                          style: IFediUiTextTheme.of(context)
                              .mediumShortBoldDarkGrey,
                        ),
                      )
                    ],
                  ));
          }

          throw "Invalid state $state";
        });
  }

  Widget buildDraftAt(BuildContext context, IDraftStatusBloc draftStatusBloc) =>
      StreamBuilder<DateTime>(
          stream: draftStatusBloc.updatedAtStream,
          initialData: draftStatusBloc.updatedAt,
          builder: (context, snapshot) {
            var draftAt = snapshot.data;
            return Text(
              dateFormat.format(draftAt),
              style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
            );
          });

  Widget buildCancelButton(
          BuildContext context, IDraftStatusBloc draftStatusBloc) =>
      PleromaAsyncOperationButtonBuilderWidget(
        builder: (context, onPressed) => IconButton(
            icon: Icon(
              FediIcons.delete,
              color: IFediUiColorTheme.of(context).darkGrey,
            ),
            iconSize: FediSizes.bigIconSize,
            onPressed: onPressed),
        asyncButtonAction: () => draftStatusBloc.cancelDraft(),
      );

  Widget buildEditButton(
          BuildContext context, IDraftStatusBloc draftStatusBloc) =>
      IconButton(
        icon: Icon(
          FediIcons.pen,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        iconSize: FediSizes.bigIconSize,
        onPressed: () async {
          var postStatusData = draftStatusBloc.calculatePostStatusData();
          goToDraftEditPostStatusPage(
            context,
            initialData: postStatusData,
          );
        },
      );
}
