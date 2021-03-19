import 'dart:async';

import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/splash/splash_page.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_indeterminate_progress_dialog.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_auth_instance_context_init_widget.dart");

class CurrentAuthInstanceContextInitWidget extends StatefulWidget {
  final Widget child;

  const CurrentAuthInstanceContextInitWidget({
    required this.child,
  });

  @override
  _CurrentAuthInstanceContextInitWidgetState createState() =>
      _CurrentAuthInstanceContextInitWidgetState();
}

class _CurrentAuthInstanceContextInitWidgetState
    extends State<CurrentAuthInstanceContextInitWidget> {
  FediIndeterminateProgressDialog? loadingInstanceProgressDialog;
  StreamSubscription? subscription;

  var disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextInitBloc.of(context, listen: false);

    var isLoading = currentInstanceContextLoadingBloc.state ==
        CurrentAuthInstanceContextInitState.loading;
    _logger.finest(() => "didChangeDependencies "
        "isLoading $isLoading disposed $disposed");
    Future.delayed(Duration(milliseconds: 100), () {
      if (isLoading && !disposed) {
        showProgressDialog(context, currentInstanceContextLoadingBloc);
      }
    });
  }

  void showProgressDialog(
    BuildContext context,
    ICurrentAuthInstanceContextInitBloc currentInstanceContextLoadingBloc,
  ) {
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isAlreadyShown = loadingInstanceProgressDialog?.isShowing == true;
    _logger.finest(() => "showProgressDialog isAlreadyShown = $isAlreadyShown");
    if (!isAlreadyShown) {
      loadingInstanceProgressDialog = FediIndeterminateProgressDialog(
        cancelableOperation: null,
        titleMessage: S
            .of(context)
            .app_auth_instance_current_context_loading_loading_title,
        contentMessage: S
            .of(context)
            .app_auth_instance_current_context_loading_loading_content(
              myAccountBloc.instance.userAtHost,
            ),
      );

      loadingInstanceProgressDialog!.show(context);

      subscription =
          currentInstanceContextLoadingBloc.stateStream.listen((state) {
        onStateChanged(currentInstanceContextLoadingBloc);
      });
    }
  }

  void onStateChanged(
    ICurrentAuthInstanceContextInitBloc currentInstanceContextLoadingBloc,
  ) {
    var state = CurrentAuthInstanceContextInitState.loading;
    var isNotLoading = currentInstanceContextLoadingBloc.state != state;
    _logger.finest(() => "onStateChanged $state isNotLoading $isNotLoading");
    if (isNotLoading) {
      hideDialog();
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
    disposed = true;
    hideDialog();
  }

  void hideDialog() {
    var isShowing = loadingInstanceProgressDialog?.isShowing == true;
    _logger.finest(() => "hideDialog isShowing $isShowing");
    if (isShowing) {
      loadingInstanceProgressDialog!.hide(context);
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
          case CurrentAuthInstanceContextInitState.invalidCredentials:
            return const _CurrentAuthInstanceContextInitSessionExpiredWidget();
          case CurrentAuthInstanceContextInitState.loading:
          case null:
            return const SplashPage();
        }
      },
    );
  }
}

class _CurrentAuthInstanceContextInitSessionExpiredWidget
    extends StatelessWidget {
  const _CurrentAuthInstanceContextInitSessionExpiredWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child:
                      const _CurrentAuthInstanceContextInitSessionExpiredDescriptionWidget(),
                ),
                const FediSmallVerticalSpacer(),
                const _CurrentAuthInstanceContextInitSessionExpiredRefreshButtonWidget(),
                const FediSmallVerticalSpacer(),
                const _CurrentAuthInstanceContextInitSessionExpiredChooseAccountButtonWidget(),
                const FediSmallVerticalSpacer(),
                const _CurrentAuthInstanceContextInitSessionExpiredLogoutButtonWidgetWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CurrentAuthInstanceContextInitSessionExpiredLogoutButtonWidgetWidget
    extends StatelessWidget {
  const _CurrentAuthInstanceContextInitSessionExpiredLogoutButtonWidgetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediTransparentTextButtonWithBorder(
      S
          .of(context)
          .app_auth_instance_current_context_loading_cantLoad_action_logout,
      onPressed: () {
        ICurrentAuthInstanceBloc.of(context, listen: false)
            .logoutCurrentInstance();
      },
      color: IFediUiColorTheme.of(context).white,
      expanded: false,
    );
  }
}

class _CurrentAuthInstanceContextInitSessionExpiredChooseAccountButtonWidget
    extends StatelessWidget {
  const _CurrentAuthInstanceContextInitSessionExpiredChooseAccountButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediTransparentTextButtonWithBorder(
      S
          .of(context)
          .app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount,
      onPressed: () {
        showMyAccountActionListBottomSheetDialog(context);
      },
      color: IFediUiColorTheme.of(context).white,
      expanded: false,
    );
  }
}

class _CurrentAuthInstanceContextInitSessionExpiredRefreshButtonWidget
    extends StatelessWidget {
  const _CurrentAuthInstanceContextInitSessionExpiredRefreshButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentInstanceContextLoadingBloc =
        ICurrentAuthInstanceContextInitBloc.of(context);

    return FediTransparentTextButtonWithBorder(
      S
          .of(context)
          .app_auth_instance_current_context_loading_cantLoad_action_refresh,
      onPressed: () {
        currentInstanceContextLoadingBloc.refreshFromNetwork(
          isNeedWaitForOptionalData: false,
        );
      },
      color: IFediUiColorTheme.of(context).white,
      expanded: false,
    );
  }
}

class _CurrentAuthInstanceContextInitSessionExpiredDescriptionWidget
    extends StatelessWidget {
  const _CurrentAuthInstanceContextInitSessionExpiredDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    return Text(
      S.of(context).app_auth_instance_current_context_loading_cantLoad_content(
            currentAuthInstanceBloc.currentInstance!.userAtHost,
          ),
      textAlign: TextAlign.center,
      style: IFediUiTextTheme.of(context).mediumShortBoldWhite,
    );
  }
}
