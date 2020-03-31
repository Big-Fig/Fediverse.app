import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/context/app_context_bloc_impl.dart';
import 'package:fedi/refactored/app/init/app_init_page.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_widget.dart");

class AppSplashWidget extends StatelessWidget {
  final AppContextBloc initBloc;

  AppSplashWidget(this.initBloc);

  @override
  Widget build(BuildContext context) {
    _logger.fine(() => "build");

    return InitialDataStreamBuilder<AsyncInitLoadingState>(
        stream: initBloc.initLoadingStateStream,
        initialData: initBloc.initLoadingState,
        builder: (context, snapshot) {
          var loadingState = snapshot.data;

          _logger.fine(() => "loadingState $loadingState");
          switch (loadingState) {
            case AsyncInitLoadingState.notStarted:
              Timer.run(() {
                initBloc.performAsyncInit();
              });
              return MaterialApp(home: InitAppPage());
              break;
            case AsyncInitLoadingState.loading:
              return MaterialApp(home: InitAppPage());
              break;
            case AsyncInitLoadingState.finished:
              return MaterialApp(home: InitAppPage());

              break;
            case AsyncInitLoadingState.failed:
              return MaterialApp(
                  home: Scaffold(
                      body: Text(
                          AppLocalizations.of(context).tr("app.init.error"))));

              break;
          }

          throw "Invalid state $loadingState";
        });
  }

}
