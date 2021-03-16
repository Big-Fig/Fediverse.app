import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_account_pagination_list_widget.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_action_button_widget.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_vertical_spacer.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountAccountBlockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_my_accountBlock_title,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const _MyAccountAccountBlockListPageWarningWidget(),
            const FediMediumVerticalSpacer(),
            const _MyAccountAccountBlockListPageAddButton(),
            const FediMediumVerticalSpacer(),
            const FediBigVerticalSpacer(),
            const FediUltraLightGreyDivider(),
            Expanded(
              child: const MyAccountAccountBlockAccountPaginationListWidget(
                customEmptyWidget: SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  const MyAccountAccountBlockListPage();
}

class _MyAccountAccountBlockListPageAddButton extends StatelessWidget {
  const _MyAccountAccountBlockListPageAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listBloc = IMyAccountAccountBlockNetworkOnlyAccountListBloc.of(
      context,
    );
    var paginationListBloc = IPaginationListBloc.of(context);
    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_account_my_accountBlock_action_add,
      expanded: false,
      onPressed: () {
        goToSingleSelectAccountPage(
          context,
          isNeedPreFetchRelationship: true,
          accountSelectedCallback: (context, account) async {
            // nothing
          },
          accountActions: [
            MyAccountAccountBlockActionButtonWidget(
              listBloc: listBloc,
              paginationListBloc: paginationListBloc,
              defaultBlocking: false,
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

class _MyAccountAccountBlockListPageWarningWidget extends StatelessWidget {
  const _MyAccountAccountBlockListPageWarningWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediNoteDescriptionWidget(
      S.of(context).app_account_block_description,
    );
  }
}

void goToMyAccountAccountBlockListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountAccountBlockListPage(),
  );
}

MaterialPageRoute createMyAccountAccountBlockListPage() {
  return MaterialPageRoute(
    builder: (context) =>
        MyAccountAccountBlockNetworkOnlyAccountListBloc.provideToContext(
      context,
      child: DisposableProvider<IAccountNetworkOnlyPaginationBloc>(
        create: (context) =>
            AccountNetworkOnlyPaginationBloc.createFromContext(context),
        child: ProxyProvider<IAccountNetworkOnlyPaginationBloc,
            INetworkOnlyPaginationBloc<PaginationPage<IAccount>, IAccount>>(
          update: (context, value, previous) => value,
          child: NetworkOnlyPaginationBlocProxyProvider<
              PaginationPage<IAccount>, IAccount>(
            child: AccountPaginationListBloc.provideToContext(
              context,
              loadFromCacheDuringInit: false,
              child: const MyAccountAccountBlockListPage(),
            ),
          ),
        ),
      ),
    ),
  );
}
