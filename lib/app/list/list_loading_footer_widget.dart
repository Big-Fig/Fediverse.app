import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListLoadingFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CustomFooter(
        builder: _builder,
      );

  const ListLoadingFooterWidget();
}

Widget _builder(BuildContext context, LoadStatus? mode) {
  Widget? body;

  switch (mode) {
    case null:
    case LoadStatus.idle:
      body = Text('');
      break;
    case LoadStatus.canLoading:
      body = Text(
        S.of(context).app_list_loading_state_canLoadMore,
      );
      break;
    case LoadStatus.loading:
      body = const FediCircularProgressIndicator();
      break;
    case LoadStatus.noMore:
      body = Text(
        S.of(context).app_list_loading_state_noMoreData,
      );
      break;
    case LoadStatus.failed:
      body = Text(
        S.of(context).app_list_loading_state_failed,
      );
      break;
  }

  return Container(
    // todo: refactor
    // ignore: no-magic-number
    height: 55.0,
    child: Center(child: body),
  );
}
