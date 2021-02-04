import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/draft/draft_edit_post_status_page.dart';
import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/fedi_text_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateFormat = DateFormat("dd MMM, HH:mm a");

class DraftStatusListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context);

    return Column(
      children: <Widget>[
        const _DraftStatusListItemHeaderWidget(),
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
                          account:
                              IMyAccountBloc.of(context, listen: false).account,
                        ),
                    child: DisposableProxyProvider<IStatus,
                        IStatusListItemTimelineBloc>(
                      update: (context, status, _) =>
                          StatusListItemTimelineBloc.list(
                        status: status,
                        displayActions: false,
                        statusCallback: null,
                        collapsible: false,
                        initialMediaAttachment: null,
                      ),
                      child: const StatusListItemTimelineWidget(),
                    )),
              );
            }),
        const FediSmallVerticalSpacer(),
      ],
    );
  }

  const DraftStatusListItemWidget();
}

class _DraftStatusListItemHeaderWidget extends StatelessWidget {
  const _DraftStatusListItemHeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context);
    return StreamBuilder<DraftStatusState>(
        stream: draftStatusBloc.stateStream,
        builder: (context, snapshot) {
          var state = snapshot.data ?? DraftStatusState.draft;

          switch (state) {
            case DraftStatusState.draft:
              return Padding(
                padding: FediPadding.horizontalSmallPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const _DraftStatusListItemDraftAtWidget(),
                    Row(
                      children: [
                        const _DraftStatusListItemEditButtonWidget(),
                        const _DraftStatusListItemCancelButtonWidget(),
                      ],
                    )
                  ],
                ),
              );
              break;
            case DraftStatusState.canceled:
              return _DraftStatusListItemCanceledWidget();
              break;
            case DraftStatusState.alreadyPosted:
              return _DraftStatusListItemAlreadyPostedWidget();
          }

          throw "Invalid state $state";
        });
  }
}

class _DraftStatusListItemAlreadyPostedWidget extends StatelessWidget {
  const _DraftStatusListItemAlreadyPostedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                S.of(context).app_status_draft_state_alreadyPosted,
                style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
              ),
            )
          ],
        ));
  }
}

class _DraftStatusListItemCanceledWidget extends StatelessWidget {
  const _DraftStatusListItemCanceledWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                S.of(context).app_status_draft_state_canceled,
                style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
              ),
            )
          ],
        ));
  }
}

class _DraftStatusListItemCancelButtonWidget extends StatelessWidget {
  const _DraftStatusListItemCancelButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context);

    return PleromaAsyncOperationButtonBuilderWidget(
      builder: (context, onPressed) => FediTextButton(
        text: S.of(context).app_account_my_statuses_draft_status_action_delete,
        color: IFediUiColorTheme.of(context).darkGrey,
        onPressed: onPressed,
      ),
      asyncButtonAction: () => draftStatusBloc.cancelDraft(),
    );
  }
}

class _DraftStatusListItemEditButtonWidget extends StatelessWidget {
  const _DraftStatusListItemEditButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context);

    return FediTextButton(
      text: S.of(context).app_account_my_statuses_draft_status_action_edit,
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () async {
        var postStatusData = draftStatusBloc.calculatePostStatusData();
        goToDraftEditPostStatusPage(
          context,
          initialData: postStatusData,
        );
      },
    );
  }
}

class _DraftStatusListItemDraftAtWidget extends StatelessWidget {
  const _DraftStatusListItemDraftAtWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var draftStatusBloc = IDraftStatusBloc.of(context);
    return StreamBuilder<DateTime>(
        stream: draftStatusBloc.updatedAtStream,
        initialData: draftStatusBloc.updatedAt,
        builder: (context, snapshot) {
          var draftAt = snapshot.data;
          return Text(
            dateFormat.format(draftAt),
            style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
          );
        });
  }
}
