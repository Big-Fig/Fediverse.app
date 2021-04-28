import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/instance_list/auth_instance_chooser_instance_list_item_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/instance_list/auth_instance_chooser_instance_list_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/chooser/instance_list/auth_instance_chooser_instance_list_item_widget.dart';
import 'package:fedi/app/auth/instance/join/add_more/add_more_join_auth_instance_page.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("auth_instance_chooser_widget.dart");

class AuthInstanceChooserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IAuthInstanceChooserBloc.of(context);

    _logger.finest(() => "build");

    return StreamBuilder<List<AuthInstance>>(
      stream: instanceChooserBloc.instancesAvailableToChooseStream,
      builder: (context, snapshot) {
        var instancesAvailableToChoose = snapshot.data;

        if (instancesAvailableToChoose == null) {
          return const SizedBox.shrink();
        }

        return ListView(
          shrinkWrap: true,
          children: [
            const _AuthInstanceChooserSelectedInstanceRowWidget(),
            StreamBuilder<List<AuthInstance>>(
              stream: instanceChooserBloc.instancesAvailableToChooseStream,
              builder: (context, snapshot) {
                var instancesAvailableToChoose = snapshot.data;

                if (instancesAvailableToChoose == null) {
                  return const SizedBox.shrink();
                }
                _logger.finest(() => "build instancesAvailableToChoose "
                    "${instancesAvailableToChoose.length}");

                return Provider<List<AuthInstance>>.value(
                  value: instancesAvailableToChoose,
                  child: const _AuthInstanceChooserItemsToChooseWidget(),
                );
              },
            ),
            const Padding(
              padding: FediPadding.allSmallPadding,
              child: _AuthInstanceChooserInstanceListItemAddAccountRowWidget(),
            ),
          ],
        );
      },
    );
  }

  Widget buildItemsToChoose(
    int itemCount,
    List<AuthInstance> instancesAvailableToChoose,
    IAuthInstanceChooserBloc instanceChooserBloc,
  ) =>
      _AuthInstanceChooserItemsToChooseWidget();

  const AuthInstanceChooserWidget();
}

class _AuthInstanceChooserItemsToChooseWidget extends StatelessWidget {
  const _AuthInstanceChooserItemsToChooseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instancesAvailableToChoose = Provider.of<List<AuthInstance>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: instancesAvailableToChoose.length,
      itemBuilder: (BuildContext context, int index) {
        var instance = instancesAvailableToChoose[index];
        return Provider<AuthInstance>.value(
          value: instance,
          child: DisposableProxyProvider<AuthInstance,
              IMyAccountLocalPreferenceBloc>(
            update: (context, value, previous) => MyAccountLocalPreferenceBloc(
              ILocalPreferencesService.of(context, listen: false),
              userAtHost: value.userAtHost,
            ),
            child: Builder(
              builder: (context) => FediAsyncInitLoadingWidget(
                asyncInitLoadingBloc:
                    IMyAccountLocalPreferenceBloc.of(context, listen: false),
                loadingFinishedBuilder: (context) {
                  var instance =
                      Provider.of<AuthInstance>(context, listen: false);

                  return DisposableProvider<IAccountBloc>(
                    create: (context) => MyAccountBloc(
                      instance: instance,
                      pleromaMyAccountService:
                          IPleromaApiMyAccountService.of(context, listen: false),
                      accountRepository:
                          IAccountRepository.of(context, listen: false),
                      myAccountLocalPreferenceBloc:
                          IMyAccountLocalPreferenceBloc.of(
                        context,
                        listen: false,
                      ),
                    ),
                    child: DisposableProxyProvider<AuthInstance,
                        IAuthInstanceChooserInstanceListItemBloc>(
                      update: (context, instance, _) =>
                          AuthInstanceChooserInstanceListItemBloc(
                        instance: instance,
                        isSelected: false,
                      ),
                      child: const AuthInstanceChooserInstanceListItemWidget(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AuthInstanceChooserSelectedInstanceRowWidget extends StatelessWidget {
  const _AuthInstanceChooserSelectedInstanceRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IAuthInstanceChooserBloc.of(context);

    // todo: remove hack
    // sometimes IMyAccountBloc is not accessible during account switching
    try {
      Provider.of<IMyAccountBloc>(context);
    } catch (e, stackTrace) {
      _logger.finest(
        () => "_AuthInstanceChooserSelectedInstanceRowWidget "
            "error fetching myAccountBloc",
        e,
        stackTrace,
      );
      return const SizedBox.shrink();
    }

    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (BuildContext context, value, previous) => value,
      child: StreamBuilder<AuthInstance?>(
        stream: instanceChooserBloc.selectedInstanceStream,
        builder: (context, snapshot) {
          var authInstance = snapshot.data;

          if(authInstance == null) {
            return const SizedBox.shrink();
          }
          return Provider<AuthInstance>.value(
            value: authInstance,
            child: DisposableProxyProvider<AuthInstance,
                IAuthInstanceChooserInstanceListItemBloc>(
              update: (context, authInstance, _) =>
                  AuthInstanceChooserInstanceListItemBloc(
                instance: authInstance,
                isSelected: true,
              ),
              child: const AuthInstanceChooserInstanceListItemWidget(),
            ),
          );
        },
      ),
    );
  }
}

class _AuthInstanceChooserInstanceListItemAddAccountRowWidget
    extends StatelessWidget {
  const _AuthInstanceChooserInstanceListItemAddAccountRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_auth_instance_chooser_action_addInstance,
      expanded: false,
      onPressed: () {
        goToAddMoreJoinAuthInstancePage(context);
      },
    );
  }
}
