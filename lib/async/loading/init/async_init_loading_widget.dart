import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AsyncInitLoadingWidget extends StatelessWidget {
  final IAsyncInitLoadingBloc asyncInitLoadingBloc;
  final WidgetBuilder loadingFinishedBuilder;

  AsyncInitLoadingWidget(
      {@required this.asyncInitLoadingBloc,
      @required this.loadingFinishedBuilder}) {
    if (asyncInitLoadingBloc.initLoadingState ==
        AsyncInitLoadingState.notStarted) {
      asyncInitLoadingBloc.performAsyncInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AsyncInitLoadingState>(
        stream: asyncInitLoadingBloc.initLoadingStateStream,
        initialData: asyncInitLoadingBloc.initLoadingState,
        builder: (context, snapshot) {
          var loadingState = snapshot.data;

          switch (loadingState) {
            case AsyncInitLoadingState.notStarted:
              return Padding(
                padding: FediPadding.allSmallPadding,
                child: Center(
                  child: Text(tr("async.init.state.not_started")),
                ),
              );
              break;
            case AsyncInitLoadingState.loading:
              return Center(child: FediCircularProgressIndicator());
              break;
            case AsyncInitLoadingState.finished:
              return loadingFinishedBuilder(context);
              break;
            case AsyncInitLoadingState.failed:
              return Padding(
                  padding: FediPadding.allSmallPadding,
                  child: Center(
                    child: Text(tr(
                        "async.init.state.failed",
                        args: [asyncInitLoadingBloc.initLoadingException.toString()])),
                  ));
              break;
          }

          throw "Invalid AsyncInitLoadingState $loadingState";
        });
  }
}
