import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_widget.dart");

class CurrentAuthInstanceContextLoadingWidget extends StatelessWidget {
  final Widget child;
  CurrentAuthInstanceContextLoadingWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextLoadingBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return InitialDataStreamBuilder<CurrentAuthInstanceContextLoadingState>(
        stream: currentInstanceContextLoadingBloc.stateStream.distinct(),
        initialData: currentInstanceContextLoadingBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;
          _logger.finest(() => "state $state");

          switch (state) {
            case CurrentAuthInstanceContextLoadingState.loading:
              var myAccountBloc = IMyAccountBloc.of(context, listen: true);

              // todo: localization
              return Center(
                  child: Text(AppLocalizations.of(context).tr(
                      "app.auth.instance.current.context.loading.loading"
                      ".content",
                      args: [myAccountBloc.instance.userAtHost])));
              break;
            case CurrentAuthInstanceContextLoadingState.localCacheExist:
              return child;
            case CurrentAuthInstanceContextLoadingState
                .cantFetchAndLocalCacheNotExist:
              return Column(
                children: <Widget>[
                  Text(AppLocalizations.of(context)
                      .tr("app.auth.instance.current.context.loading.cant_load"
                          ".content")),
                  RaisedButton(
                    child: Text(AppLocalizations.of(context).tr(
                        "app.auth.instance.current.context.loading.cant_load"
                        ".action.refresh")),
                    onPressed: () {
                      currentInstanceContextLoadingBloc.refresh();
                    },
                  ),
                  RaisedButton(
                    child: Text(AppLocalizations.of(context).tr(
                        "app.auth.instance.current.context.loading.cant_load"
                        ".action.choose_different_account")),
                    onPressed: () {
                      showMyAccountActionListBottomSheetDialog(context);
                    },
                  ),
                ],
              );
              break;
          }

          throw "Invalid state $state";
        });
  }
}
