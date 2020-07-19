import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/init/app_async_init_loading_widget.dart';
import 'package:fedi/app/init/app_init_page.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/progress/fedi_indeterminate_progress_dialog.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_widget.dart");

class CurrentAuthInstanceContextLoadingWidget extends StatefulWidget {
  final Widget child;

  const CurrentAuthInstanceContextLoadingWidget({@required this.child});

  @override
  _CurrentAuthInstanceContextLoadingWidgetState createState() =>
      _CurrentAuthInstanceContextLoadingWidgetState();
}

class _CurrentAuthInstanceContextLoadingWidgetState
    extends State<CurrentAuthInstanceContextLoadingWidget> {
  FediIndeterminateProgressDialog dialog;
  StreamSubscription subscription;

  var disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextLoadingBloc.of(context, listen: false);

    if (currentInstanceContextLoadingBloc.state ==
        CurrentAuthInstanceContextLoadingState.loading) {
      var myAccountBloc = IMyAccountBloc.of(context, listen: false);
      dialog = FediIndeterminateProgressDialog(
          cancelableOperation: null,
          titleMessage: "app.auth.instance.current.context.loading.loading"
                  ".title"
              .tr(),
          contentMessage: tr(
              "app.auth.instance.current.context.loading.loading.content",
              args: [myAccountBloc.instance.userAtHost]));

      Future.delayed(Duration(milliseconds: 100), () {
        if (!disposed) {
          dialog.show(context);
        }
      });

      subscription =
          currentInstanceContextLoadingBloc.stateStream.listen((state) {
        if (currentInstanceContextLoadingBloc.state !=
            CurrentAuthInstanceContextLoadingState.loading) {
          hideDialog();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
    hideDialog();
  }

  void hideDialog() {
    if (dialog?.isShowing == true) {
      dialog.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextLoadingBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return Scaffold(
      body: AppAsyncInitLoadingWidget(
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
                    return const AppInitPage();
                    break;
                  case CurrentAuthInstanceContextLoadingState.localCacheExist:
                    return widget.child;
                  case CurrentAuthInstanceContextLoadingState
                      .cantFetchAndLocalCacheNotExist:
                    return _buildSessionExpired(
                        currentInstanceContextLoadingBloc, context);
                    break;
                }

                throw "Invalid state $state";
              });
        },
      ),
    );
  }

  FediLightStatusBarStyleArea _buildSessionExpired(
      ICurrentAuthInstanceContextLoadingBloc currentInstanceContextLoadingBloc,
      BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: FediColors.primaryColorDark,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: FediPadding.allBigPadding,
                  child: Text(
                    tr(
                        "app.auth.instance.current.context.loading.cant_load"
                        ".content",
                        args: [
                          currentAuthInstanceBloc.currentInstance.userAtHost
                        ]),
                    textAlign: TextAlign.center,
                    style: FediTextStyles.mediumShortBoldWhite,
                  ),
                ),
                Padding(
                  padding: FediPadding.allSmallPadding,
                  child: FediGreyFilledTextButton(
                    tr("app.auth.instance.current.context.loading.cant_load"
                        ".action.refresh"),
                    onPressed: () {
                      currentInstanceContextLoadingBloc.refresh();
                    },
                  ),
                ),
                Padding(
                  padding: FediPadding.allSmallPadding,
                  child: FediGreyFilledTextButton(
                    tr("app.auth.instance.current.context.loading.cant_load"
                        ".action.choose_different_account"),
                    onPressed: () {
                      showMyAccountActionListBottomSheetDialog(context);
                    },
                  ),
                ),
                Padding(
                  padding: FediPadding.allSmallPadding,
                  child: FediGreyFilledTextButton(
                    tr("app.auth.instance.current.context.loading.cant_load"
                        ".action.logout"),
                    onPressed: () {
                      ICurrentAuthInstanceBloc.of(context, listen: false)
                          .logoutCurrentInstance();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
