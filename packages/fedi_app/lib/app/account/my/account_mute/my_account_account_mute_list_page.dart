import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/account_mute/action/my_account_account_mute_action_list_widget.dart';
import 'package:fedi_app/app/account/my/account_mute/my_account_account_mute_account_pagination_list_widget.dart';
import 'package:fedi_app/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi_app/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/account/select/single/single_select_account_page.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi_app/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi_app/app/ui/spacer/fedi_medium_vertical_spacer.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountAccountMuteListPage extends StatelessWidget {
  const MyAccountAccountMuteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_accountMute_title,
        ),
        body: SafeArea(
          child: Column(
            children: const [
              _MyAccountAccountMuteListPageWarningWidget(),
              FediMediumVerticalSpacer(),
              _MyAccountAccountMuteListPageAddButton(),
              FediMediumVerticalSpacer(),
              FediBigVerticalSpacer(),
              FediUltraLightGreyDivider(),
              Expanded(
                child: MyAccountAccountMuteAccountPaginationListWidget(
                  customEmptyWidget: SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      );
}

class _MyAccountAccountMuteListPageAddButton extends StatelessWidget {
  const _MyAccountAccountMuteListPageAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountAccountMuteNetworkOnlyAccountListBloc =
        IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);

    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_account_my_accountMute_action_add,
      expanded: false,
      onPressed: () {
        goToSingleSelectAccountPage(
          context,
          isNeedPreFetchRelationship: true,
          // ignore: no-empty-block
          accountSelectedCallback: (context, account) async {
            // nothing
          },
          accountActions: [
            Provider<IMyAccountAccountMuteNetworkOnlyAccountListBloc>.value(
              value: myAccountAccountMuteNetworkOnlyAccountListBloc,
              child: Provider<IPaginationListBloc>.value(
                value: paginationListBloc,
                child: const MyAccountAccountMuteActionListWidget(
                  defaultMuting: false,
                ),
              ),
            ),
          ],
          excludeMyAccount: true,
          followingsOnly: false,
          customRemoteAccountListLoader: null,
          customLocalAccountListLoader: null,
        );
      },
    );
  }
}

class _MyAccountAccountMuteListPageWarningWidget extends StatelessWidget {
  const _MyAccountAccountMuteListPageWarningWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_account_mute_description,
      );
}

void goToMyAccountAccountMuteListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountAccountMuteListPage(),
  );
}

MaterialPageRoute<void> createMyAccountAccountMuteListPage() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          MyAccountAccountMuteNetworkOnlyAccountListBloc.provideToContext(
        context,
        child: DisposableProvider<IAccountNetworkOnlyPaginationBloc>(
          create: AccountNetworkOnlyPaginationBloc.createFromContext,
          child: ProxyProvider<IAccountNetworkOnlyPaginationBloc,
              INetworkOnlyPaginationBloc<PaginationPage<IAccount>, IAccount>>(
            update: (context, value, previous) => value,
            child: NetworkOnlyPaginationBlocProxyProvider<
                PaginationPage<IAccount>, IAccount>(
              child: AccountPaginationListBloc.provideToContext(
                context,
                loadFromCacheDuringInit: false,
                child: const MyAccountAccountMuteListPage(),
              ),
            ),
          ),
        ),
      ),
    );
