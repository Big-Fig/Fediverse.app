import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final _logger = Logger('instance_public_timeline_widget.dart');

class InstancePublicTimelineWidget extends StatelessWidget {
  const InstancePublicTimelineWidget();

  @override
  Widget build(BuildContext context) {
    var instancePublicTimelineBloc = IInstancePublicTimelineBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: instancePublicTimelineBloc,
      loadingFinishedBuilder: (context) {
        return FediListSmartRefresherWidget(
          controller: instancePublicTimelineBloc.refreshController,
          onRefresh: () async {
            try {
              await instancePublicTimelineBloc.refresh();

              return FediListSmartRefresherLoadingState.loaded;
            } catch (e, stackTrace) {
              _logger.warning(
                () => 'instancePublicTimelineBloc.refresh',
                e,
                stackTrace,
              );

              return FediListSmartRefresherLoadingState.failed;
            }
          },
          onLoading: null,
          child: Text("asd"),
        );
      },
    );
  }
}
