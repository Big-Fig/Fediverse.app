import 'package:fedi/refactored/app/account/my/actions/my_account_actions_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_model.dart';
import 'package:fedi/refactored/app/home/home_bloc.dart';
import 'package:fedi/refactored/app/home/home_bloc_impl.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/app/home/home_page.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_widget.dart");

class CurrentInstanceContextLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentInstanceContextLoadingBloc.of(context, listen: false);

    _logger.finest(() => "build");



    return StreamBuilder<CurrentInstanceContextLoadingState>(
        stream: currentInstanceContextLoadingBloc.stateStream.distinct(),
//        initialData: currentInstanceContextLoadingBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;
          _logger.finest(() => "state $state");
          if (state == null) {
            return SizedBox.shrink();
          }
          switch (state) {
            case CurrentInstanceContextLoadingState.loading:
              var myAccountBloc = IMyAccountBloc.of(context, listen: true);

              // todo: localization
              return Center(
                  child: Text("Loading ${myAccountBloc.instance.userAtHost}"));
              break;
            case CurrentInstanceContextLoadingState.localCacheExist:
              return const HomePage();
            case CurrentInstanceContextLoadingState
                .cantFetchAndLocalCacheNotExist:
              return Column(
                children: <Widget>[
                  // todo: localization
                  Text("Can't load current instance"),
                  RaisedButton(
                    child: Text("Refresh"),
                    onPressed: () {
                      currentInstanceContextLoadingBloc.refresh();
                    },
                  ),
                  RaisedButton(
                    child: Text("Choose different account"),
                    onPressed: () {
                      showMyAccountActionsBottomSheetDialog(context);
                    },
                  ),
                ],
              );
              break;
          }

          throw "Invalid state $state";
        });
  }

  HomePage buildHomePage() {
    _logger.finest(() => "buildHomePage");
    return HomePage();
  }
}
