import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class StatusCachedListBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  const StatusCachedListBlocLoadingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: IStatusCachedListBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
