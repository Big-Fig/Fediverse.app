import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_instance_list_item_widget.dart';
import 'package:fedi/app/auth/instance/join/add_more/add_more_join_auth_instance_page.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("instance_chooser_widget.dart");

class AuthInstanceChooserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc =
        IAuthInstanceChooserBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return StreamBuilder<List<AuthInstance>>(
        stream: instanceChooserBloc.instancesAvailableToChooseStream,
        initialData: instanceChooserBloc.instancesAvailableToChoose,
        builder: (context, snapshot) {
          var instancesAvailableToChoose = snapshot.data;

          if (instancesAvailableToChoose == null) {
            return SizedBox.shrink();
          }
          _logger.finest(() => "build instancesAvailableToChoose "
              "${instancesAvailableToChoose.length}");
          var itemCount = instancesAvailableToChoose.length;

          return ListView(
            shrinkWrap: true,
            children: [
              ProxyProvider<IMyAccountBloc, IAccountBloc>(
                update: (BuildContext context, value, previous) => value,
                child: AuthInstanceChooserInstanceListItemWidget(
                    instance: instanceChooserBloc.selectedInstance,
                    isSelected: true),
              ),
              buildItemsToChoose(
                  itemCount, instancesAvailableToChoose, instanceChooserBloc),
              Padding(
                padding: FediPadding.allSmallPadding,
                child: buildAddAccountRow(context),
              )
            ],
          );
        });
  }

  Widget buildItemsToChoose(
    int itemCount,
    List<AuthInstance> instancesAvailableToChoose,
    IAuthInstanceChooserBloc instanceChooserBloc,
  ) =>
      ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          var instance = instancesAvailableToChoose[index];
          return Provider<AuthInstance>.value(
            value: instance,
            child: DisposableProxyProvider<AuthInstance,
                IMyAccountLocalPreferenceBloc>(
              update: (context, value, previous) =>
                  MyAccountLocalPreferenceBloc(
                      ILocalPreferencesService.of(context, listen: false),
                      value.userAtHost),
              child: Builder(
                builder: (context) => AsyncInitLoadingWidget(
                  asyncInitLoadingBloc:
                      IMyAccountLocalPreferenceBloc.of(context, listen: false),
                  loadingFinishedBuilder: (context) {
                    var instance =
                        Provider.of<AuthInstance>(context, listen: false);

                    return DisposableProvider<IAccountBloc>(
                      create: (context) => MyAccountBloc(
                        instance: instance,
                        pleromaMyAccountService:
                            IPleromaMyAccountService.of(context, listen: false),
                        accountRepository:
                            IAccountRepository.of(context, listen: false),
                        myAccountLocalPreferenceBloc:
                            IMyAccountLocalPreferenceBloc.of(context,
                                listen: false),
                      ),
                      child: AuthInstanceChooserInstanceListItemWidget(
                        instance: instance,
                        isSelected: false,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );

  Widget buildAddAccountRow(BuildContext context) =>
      FediPrimaryFilledTextButton(
        tr("app.auth.instance.chooser.action.add_instance"),
        expanded: false,
        onPressed: () {
          goToAddMoreJoinAuthInstancePage(context);
        },
      );

  const AuthInstanceChooserWidget();
}
