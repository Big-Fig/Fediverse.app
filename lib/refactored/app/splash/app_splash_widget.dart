import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/context/app_context_bloc.dart';
import 'package:fedi/refactored/app/init/app_init_page.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_widget.dart");

class AppSplashWidget extends StatelessWidget {
  const AppSplashWidget();

  @override
  Widget build(BuildContext context) {
    _logger.fine(() => "build");

    var appContextBloc = IAppContextBloc.of(context, listen: false);

    return StreamBuilder<AsyncInitLoadingState>(
        stream: appContextBloc.initLoadingStateStream,
        initialData: appContextBloc.initLoadingState,
        builder: (context, snapshot) {
          var loadingState = snapshot.data;

          _logger.fine(() => "loadingState $loadingState");
          switch (loadingState) {
            case AsyncInitLoadingState.notStarted:
              Timer.run(() {
                appContextBloc.performAsyncInit();
              });
              return const MaterialApp(home: InitAppPage());
              break;
            case AsyncInitLoadingState.loading:
              return const MaterialApp(home: InitAppPage());
              break;
            case AsyncInitLoadingState.finished:
              return const MaterialApp(home: InitAppPage());

              break;
            case AsyncInitLoadingState.failed:
              return MaterialApp(
                  home: Scaffold(
                      body: Text(AppLocalizations.of(context)
                          .tr("app.splash.state.error"))));

              break;
          }

          throw "Invalid state $loadingState";
        });
  }
}
