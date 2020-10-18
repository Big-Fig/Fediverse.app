import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/splash/splash_page.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_indeterminate_progress_dialog.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_widget.dart");

class CurrentAuthInstanceContextInitWidget extends StatefulWidget {
  final Widget child;

  const CurrentAuthInstanceContextInitWidget({@required this.child});

  @override
  _CurrentAuthInstanceContextInitWidgetState createState() =>
      _CurrentAuthInstanceContextInitWidgetState();
}

class _CurrentAuthInstanceContextInitWidgetState
    extends State<CurrentAuthInstanceContextInitWidget> {
  FediIndeterminateProgressDialog progressDialog;
  StreamSubscription subscription;

  var disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextInitBloc.of(context, listen: false);

    Future.delayed(Duration(milliseconds: 100), () {
      if (currentInstanceContextLoadingBloc.state ==
              CurrentAuthInstanceContextInitState.loading &&
          !disposed) {
        var myAccountBloc = IMyAccountBloc.of(context, listen: false);
        progressDialog = FediIndeterminateProgressDialog(
            cancelableOperation: null,
            titleMessage: "app.auth.instance.current.context.loading.loading"
                    ".title"
                .tr(),
            contentMessage: tr(
                "app.auth.instance.current.context.loading.loading.content",
                args: [myAccountBloc.instance.userAtHost]));

        progressDialog.show(context);

        subscription =
            currentInstanceContextLoadingBloc.stateStream.listen((state) {
          if (currentInstanceContextLoadingBloc.state !=
              CurrentAuthInstanceContextInitState.loading) {
            hideDialog();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
    disposed = true;
    hideDialog();
  }

  void hideDialog() {
    if (progressDialog?.isShowing == true) {
      progressDialog.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextInitBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return StreamBuilder<CurrentAuthInstanceContextInitState>(
        stream: currentInstanceContextLoadingBloc.stateStream.distinct(),
        initialData: currentInstanceContextLoadingBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;
          _logger.finest(() => "state $state");

          switch (state) {
            case CurrentAuthInstanceContextInitState.localCacheExist:
              return widget.child;
            case CurrentAuthInstanceContextInitState
                .cantFetchAndLocalCacheNotExist:
              return _buildSessionExpiredPage(
                  currentInstanceContextLoadingBloc, context);
              break;
            case CurrentAuthInstanceContextInitState.loading:
            default:
              return const SplashPage();
              break;
          }
        });
  }

  Widget _buildSessionExpiredPage(
      ICurrentAuthInstanceContextInitBloc currentInstanceContextLoadingBloc,
      BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: IFediUiColorTheme.of(context).primaryDark,
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
                    style: IFediUiTextTheme.of(context).mediumShortBoldWhite,
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
