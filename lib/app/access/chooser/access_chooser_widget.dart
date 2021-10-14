import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/chooser/access_chooser_bloc.dart';
import 'package:fedi/app/access/chooser/instance_list/access_chooser_instance_list_item_bloc.dart';
import 'package:fedi/app/access/chooser/instance_list/access_chooser_instance_list_item_bloc_impl.dart';
import 'package:fedi/app/access/chooser/instance_list/access_chooser_instance_list_item_widget.dart';
import 'package:fedi/app/access/join/add_more/add_more_join_access_page.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('auth_instance_chooser_widget.dart');

class UnifediApiAccessChooserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IUnifediApiAccessChooserBloc.of(context);

    _logger.finest(() => 'build');

    return StreamBuilder<List<UnifediApiAccess>>(
      stream: instanceChooserBloc.instancesAvailableToChooseStream,
      builder: (context, snapshot) {
        var instancesAvailableToChoose = snapshot.data;

        if (instancesAvailableToChoose == null) {
          return const SizedBox.shrink();
        }

        return ListView(
          shrinkWrap: true,
          children: [
            const _UnifediApiAccessChooserSelectedInstanceRowWidget(),
            StreamBuilder<List<UnifediApiAccess>>(
              stream: instanceChooserBloc.instancesAvailableToChooseStream,
              builder: (context, snapshot) {
                var instancesAvailableToChoose = snapshot.data;

                if (instancesAvailableToChoose == null) {
                  return const SizedBox.shrink();
                }
                _logger.finest(
                  () => 'build instancesAvailableToChoose '
                      '${instancesAvailableToChoose.length}',
                );

                return Provider<List<UnifediApiAccess>>.value(
                  value: instancesAvailableToChoose,
                  child: const _UnifediApiAccessChooserItemsToChooseWidget(),
                );
              },
            ),
            const Padding(
              padding: FediPadding.allSmallPadding,
              child:
                  _UnifediApiAccessChooserInstanceListItemAddAccountRowWidget(),
            ),
          ],
        );
      },
    );
  }

  Widget buildItemsToChoose(
    int itemCount,
    List<UnifediApiAccess> instancesAvailableToChoose,
    IUnifediApiAccessChooserBloc instanceChooserBloc,
  ) =>
      const _UnifediApiAccessChooserItemsToChooseWidget();

  const UnifediApiAccessChooserWidget({
    Key? key,
  }) : super(key: key);
}

class _UnifediApiAccessChooserItemsToChooseWidget extends StatelessWidget {
  const _UnifediApiAccessChooserItemsToChooseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instancesAvailableToChoose =
        Provider.of<List<UnifediApiAccess>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: instancesAvailableToChoose.length,
      itemBuilder: (BuildContext context, int index) {
        var instance = instancesAvailableToChoose[index];

        return Provider<UnifediApiAccess>.value(
          value: instance,
          child: DisposableProxyProvider<UnifediApiAccess,
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
                      Provider.of<UnifediApiAccess>(context, listen: false);

                  // todo: remove hack
                  // sometimes IUnifediApiMyAccountService is not accessible
                  // during account switching
                  try {
                    Provider.of<IUnifediApiMyAccountService>(context);
                    // ignore: avoid_catches_without_on_clauses
                  } catch (e) {
                    _logger.finest(
                      () => 'error fetching IUnifediApiMyAccountService',
                    );

                    return const SizedBox.shrink();
                  }

                  return DisposableProvider<IAccountBloc>(
                    create: (context) => MyAccountBloc(
                      instance: instance,
                      apiMyAccountService:
                          Provider.of<IUnifediApiMyAccountService>(
                        context,
                        listen: false,
                      ),
                      accountRepository:
                          IAccountRepository.of(context, listen: false),
                      myAccountLocalPreferenceBloc:
                          IMyAccountLocalPreferenceBloc.of(
                        context,
                        listen: false,
                      ),
                    ),
                    child: DisposableProxyProvider<UnifediApiAccess,
                        IUnifediApiAccessChooserInstanceListItemBloc>(
                      update: (context, instance, _) =>
                          UnifediApiAccessChooserInstanceListItemBloc(
                        instance: instance,
                        isSelected: false,
                      ),
                      child:
                          const UnifediApiAccessChooserInstanceListItemWidget(),
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

class _UnifediApiAccessChooserSelectedInstanceRowWidget
    extends StatelessWidget {
  const _UnifediApiAccessChooserSelectedInstanceRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IUnifediApiAccessChooserBloc.of(context);

    // todo: remove hack
    // sometimes IMyAccountBloc is not accessible during account switching
    try {
      Provider.of<IMyAccountBloc>(context);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _logger.finest(
        () => '_UnifediApiAccessChooserSelectedInstanceRowWidget '
            'error fetching myAccountBloc',
      );

      return const SizedBox.shrink();
    }

    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (BuildContext context, value, previous) => value,
      child: StreamBuilder<UnifediApiAccess?>(
        stream: instanceChooserBloc.selectedInstanceStream,
        builder: (context, snapshot) {
          var authInstance = snapshot.data;

          if (authInstance == null) {
            return const SizedBox.shrink();
          }

          return Provider<UnifediApiAccess>.value(
            value: authInstance,
            child: DisposableProxyProvider<UnifediApiAccess,
                IUnifediApiAccessChooserInstanceListItemBloc>(
              update: (context, authInstance, _) =>
                  UnifediApiAccessChooserInstanceListItemBloc(
                instance: authInstance,
                isSelected: true,
              ),
              child: const UnifediApiAccessChooserInstanceListItemWidget(),
            ),
          );
        },
      ),
    );
  }
}

class _UnifediApiAccessChooserInstanceListItemAddAccountRowWidget
    extends StatelessWidget {
  const _UnifediApiAccessChooserInstanceListItemAddAccountRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_auth_instance_chooser_action_addInstance,
        expanded: false,
        onPressed: () {
          goToAddMoreJoinUnifediApiAccessPage(context);
        },
      );
}
