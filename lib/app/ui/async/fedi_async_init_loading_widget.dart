import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediAsyncInitLoadingWidget extends StatelessWidget {
  final IAsyncInitLoadingBloc asyncInitLoadingBloc;
  final WidgetBuilder loadingFinishedBuilder;

  FediAsyncInitLoadingWidget({
    @required this.asyncInitLoadingBloc,
    @required this.loadingFinishedBuilder,
  });

  @override
  Widget build(BuildContext context) => AsyncInitLoadingWidget(
        asyncInitLoadingBloc: asyncInitLoadingBloc,
        loadingFinishedBuilder: loadingFinishedBuilder,
        loadingWidget: const FediCircularProgressIndicator(),
      );
}
