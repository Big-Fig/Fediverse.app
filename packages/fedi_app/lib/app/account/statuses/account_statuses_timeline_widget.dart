import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_page.dart';
import 'package:fedi_app/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi_app/app/ui/list/fedi_list_tile.dart';
import 'package:fedi_app/pagination/list/pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountStatusesTimelineWidget extends AccountStatusesWidget {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const AccountStatusesTimelineWidget({
    Key? key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    ScrollController? scrollController,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          scrollController: scrollController,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IStatus> items,
    required Widget? header,
    required Widget? footer,
  }) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        keyboardDismissBehavior: keyboardDismissBehavior,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) => Provider<IStatus>.value(
          value: items[index],
          child: FediListTile(
            isFirstInList: index == 0 && alwaysShowHeader != true,
            child:
                DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
              update: (context, status, _) => StatusListItemTimelineBloc.list(
                status: status,
                collapsible: true,
                statusCallback: _onStatusClick,
                initialMediaAttachment: null,
              ),
              child: const StatusListItemTimelineWidget(),
            ),
          ),
        ),
      );
}

Future<void> _onStatusClick(BuildContext context, IStatus status) async {
  var accountBloc = IAccountBloc.of(context, listen: false);

  var isLocal = accountBloc.instanceLocation == InstanceLocation.local;

  if (isLocal) {
    await goToLocalStatusThreadPage(
      context,
      status: status,
      initialMediaAttachment: null,
    );
  } else {
    await goToRemoteStatusThreadPageBasedOnRemoteInstanceStatusWithoutRemoteInstanceBloc(
      context,
      remoteInstanceStatus: status,
      remoteInstanceInitialMediaAttachment: null,
    );
  }
}
