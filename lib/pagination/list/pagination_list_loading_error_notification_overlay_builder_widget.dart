import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:flutter/cupertino.dart';

DateTime _lastRefreshErrorShowedDateTime = DateTime.now();
DateTime _lastLoadMoreErrorShowedDateTime = DateTime.now();

final Duration _throttleDuration = Duration(seconds: 2);

class PaginationListLoadingErrorNotificationOverlayBuilderWidget
    extends StatefulWidget {
  final IPaginationListBloc paginationListBloc;

  PaginationListLoadingErrorNotificationOverlayBuilderWidget(
      this.paginationListBloc);

  @override
  _PaginationListLoadingErrorNotificationOverlayBuilderWidgetState
      createState() =>
          _PaginationListLoadingErrorNotificationOverlayBuilderWidgetState();
}

class _PaginationListLoadingErrorNotificationOverlayBuilderWidgetState
    extends State<PaginationListLoadingErrorNotificationOverlayBuilderWidget> {
  DisposableOwner disposable = DisposableOwner();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposable.addDisposable(streamSubscription:
        widget.paginationListBloc.refreshStateStream.listen((state) {
      if (state == PaginationListLoadingState.failed) {
        var now = DateTime.now();
        var difference = now.difference(_lastRefreshErrorShowedDateTime);
        if (difference > _throttleDuration) {
          _lastRefreshErrorShowedDateTime = now;
          showErrorFediNotificationOverlay(
              contentText: "app.list.refresh.unable_to_fetch".tr(),
              titleText: null);
        }
      }
    }));
    disposable.addDisposable(streamSubscription:
        widget.paginationListBloc.loadMoreStateStream.listen((state) {
      if (state == PaginationListLoadingState.failed) {
        var now = DateTime.now();
        var difference = now.difference(_lastLoadMoreErrorShowedDateTime);
        if (difference > _throttleDuration) {
          _lastLoadMoreErrorShowedDateTime = now;
          showErrorFediNotificationOverlay(
              contentText: "app.list.loading.state.failed".tr(),
              titleText: null);
        }
      }
    }));
  }

  @override
  void dispose() {
    super.dispose();
    disposable.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
