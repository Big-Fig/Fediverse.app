import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_widget.dart");

class CurrentAuthInstanceContextLoadingWidget extends StatelessWidget {
  final Widget child;

  const CurrentAuthInstanceContextLoadingWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextLoadingBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return Scaffold(
      body: AsyncInitLoadingWidget(
        asyncInitLoadingBloc: currentInstanceContextLoadingBloc,
        loadingFinishedBuilder: (BuildContext context) {
          return StreamBuilder<CurrentAuthInstanceContextLoadingState>(
              stream: currentInstanceContextLoadingBloc.stateStream.distinct(),
              initialData: currentInstanceContextLoadingBloc.state,
              builder: (context, snapshot) {
                var state = snapshot.data;
                _logger.finest(() => "state $state");

                switch (state) {
                  case CurrentAuthInstanceContextLoadingState.loading:
                    var myAccountBloc =
                        IMyAccountBloc.of(context, listen: true);

                    return Semantics(
                        container: true,
                        child: AnnotatedRegion<SystemUiOverlayStyle>(
                            value: SystemUiOverlayStyle.light,
                            child: Scaffold(
                              backgroundColor: FediColors.primaryColor,
                              body: SafeArea(
                                child: Center(
                                    child: Text(
                                  tr(
                                      "app.auth.instance.current.context.loading.loading"
                                      ".content",
                                      args: [
                                        myAccountBloc.instance.userAtHost
                                      ]),
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )));
                    break;
                  case CurrentAuthInstanceContextLoadingState.localCacheExist:
                    return child;
                  case CurrentAuthInstanceContextLoadingState
                      .cantFetchAndLocalCacheNotExist:
                    return Semantics(
                      container: true,
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: SystemUiOverlayStyle.light,
                        child: Scaffold(
                          backgroundColor: FediColors.primaryColor,
                          body: SafeArea(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      tr(
                                          "app.auth.instance.current.context.loading.cant_load"
                                          ".content"),
                                      style: TextStyle(
                                          color: FediColors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FediGreyFilledTextButton(
                                      tr(
                                          "app.auth.instance.current.context.loading.cant_load"
                                          ".action.refresh"),
                                      onPressed: () {
                                        currentInstanceContextLoadingBloc
                                            .refresh();
                                      },
                                      textColor: FediColors.darkGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FediGreyFilledTextButton(
                                      tr(
                                          "app.auth.instance.current.context.loading.cant_load"
                                          ".action.choose_different_account"),
                                      onPressed: () {
                                        showMyAccountActionListBottomSheetDialog(
                                            context);
                                      },
                                      textColor: FediColors.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                    break;
                }

                throw "Invalid state $state";
              });
        },
      ),
    );
  }
}
