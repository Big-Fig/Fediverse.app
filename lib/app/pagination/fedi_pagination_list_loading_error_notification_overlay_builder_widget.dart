import 'package:fedi/app/toast/toast_service.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';

import 'package:flutter/cupertino.dart';

DateTime _lastRefreshErrorShowedDateTime = DateTime.now();
DateTime _lastLoadMoreErrorShowedDateTime = DateTime.now();

// ignore: no-magic-number
final Duration _throttleDuration = Duration(seconds: 2);

class FediPaginationListLoadingErrorNotificationOverlayBuilderWidget<T>
    extends StatefulWidget {
  const FediPaginationListLoadingErrorNotificationOverlayBuilderWidget();

  @override
  _FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState
      createState() =>
          _FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState();
}

class _FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState
    extends State<
        FediPaginationListLoadingErrorNotificationOverlayBuilderWidget> {
  DisposableOwner disposable = DisposableOwner();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var paginationListBloc = IPaginationListBloc.of(context, listen: false);

    paginationListBloc.refreshErrorStream.listen(
      (paginationListLoadingError) {
        var now = DateTime.now();
        var difference = now.difference(_lastRefreshErrorShowedDateTime);
        if (difference > _throttleDuration) {
          _lastRefreshErrorShowedDateTime = now;
          IToastService.of(context, listen: false).showErrorToast(
            context: context,
            content: '${_errorToString(paginationListLoadingError)}',
            title: S.of(context).app_list_refresh_unableToFetch,
          );
        }
      },
    ).disposeWith(disposable);
    paginationListBloc.loadMoreErrorStream.listen(
      (paginationListLoadingError) {
        var now = DateTime.now();
        var difference = now.difference(_lastLoadMoreErrorShowedDateTime);
        if (difference > _throttleDuration) {
          _lastLoadMoreErrorShowedDateTime = now;
          IToastService.of(context, listen: false).showErrorToast(
            context: context,
            content: '${_errorToString(paginationListLoadingError)}',
            title: S.of(context).app_list_loading_state_failed,
          );
        }
      },
    ).disposeWith(disposable);
  }

  String _errorToString(PaginationListLoadingError paginationListLoadingError) {
    var error = paginationListLoadingError.error;
    if (error is CantUpdateFromNetworkException) {
      return S.of(context).app_list_cantUpdateFromNetwork;
    } else {
      if (error is UnifediApiRestException &&
          error.decodedErrorDescriptionOrBody.isNotEmpty) {
        return error.decodedErrorDescriptionOrBody;
      } else {
        return error.toString();
      }
    }
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
