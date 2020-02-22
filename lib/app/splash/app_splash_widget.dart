import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/init/app_init_page.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_widget.dart");

class AppSplashWidget extends StatelessWidget {
  final AppContextBloc initBloc;

  AppSplashWidget(this.initBloc);

  @override
  Widget build(BuildContext context) => _buildApp(context);

  Widget _buildApp(BuildContext context) {
    _logger.fine(() => "_buildApp");

    return StreamBuilder<AsyncInitLoadingState>(
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
