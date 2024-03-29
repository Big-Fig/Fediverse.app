import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:unifedi_api/unifedi_api.dart';

DateTime _lastRefreshErrorShowedDateTime = DateTime.now();
DateTime _lastLoadMoreErrorShowedDateTime = DateTime.now();

// ignore: no-magic-number
const Duration _throttleDuration = Duration(seconds: 2);

class FediPaginationListLoadingErrorNotificationOverlayBuilderWidget
    extends StatefulWidget {
  const FediPaginationListLoadingErrorNotificationOverlayBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState
      createState() =>
          FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState();
}

class FediPaginationListLoadingErrorNotificationOverlayBuilderWidgetState
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
            content: _errorToString(paginationListLoadingError),
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
            content: _errorToString(paginationListLoadingError),
            title: S.of(context).app_list_loading_state_failed,
          );
        }
      },
    ).disposeWith(disposable);
  }

  String _errorToString(PaginationListLoadingError paginationListLoadingError) {
    dynamic error = paginationListLoadingError.error;
    if (error is CantUpdateFromNetworkException) {
      return S.of(context).app_list_cantUpdateFromNetwork;
    } else {
      if (error is IUnifediApiRestErrorException &&
          error.unifediError.descriptionOrContent != null) {
        return error.unifediError.descriptionOrContent!;
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
  Widget build(BuildContext context) => const SizedBox.shrink();
}
