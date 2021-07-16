import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class StatusCachedListBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  StatusCachedListBlocLoadingWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: IStatusCachedListBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
