import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/domain_block/add/add_my_account_domain_block_dialog.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_widget.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_domainBlock_title,
        ),
        body: SafeArea(
          child: Column(
            children: const [
              _MyAccountDomainBlockListPageWarningWidget(),
              FediMediumVerticalSpacer(),
              _MyAccountDomainBlockListPageAddButton(),
              FediMediumVerticalSpacer(),
              FediBigVerticalSpacer(),
              FediUltraLightGreyDivider(),
              Expanded(
                child: _MyAccountDomainBlockListPageBody(
                  customEmptyWidget: SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      );
}

class _MyAccountDomainBlockListPageBody extends StatelessWidget {
  final Widget? customEmptyWidget;
  final Widget? customLoadingWidget;

  const _MyAccountDomainBlockListPageBody({
    Key? key,
    this.customEmptyWidget,
    this.customLoadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: MyAccountDomainBlockPaginationListWidget(
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
          key: PageStorageKey('MyAccountDomainBlockListPage'),
          domainBlockSelectedCallback: null,
          domainBlockActions: const <Widget>[
            _MyAccountDomainBlockListPageRemoveItemAction(),
          ],
        ),
      );
}

class _MyAccountDomainBlockListPageAddButton extends StatelessWidget {
  const _MyAccountDomainBlockListPageAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_account_my_domainBlock_action_add,
        expanded: false,
        onPressed: () {
          AddMyAccountDomainBlockDialog.createFromContext(
            context: context,
            successCallback: () {
              IPaginationListBloc.of(context, listen: false)
                  .refreshWithController();
            },
          ).show<void>(context);
        },
      );
}

class _MyAccountDomainBlockListPageWarningWidget extends StatelessWidget {
  const _MyAccountDomainBlockListPageWarningWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_account_domainBlock_description,
      );
}

class _MyAccountDomainBlockListPageRemoveItemAction extends StatelessWidget {
  const _MyAccountDomainBlockListPageRemoveItemAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountDomainBlockNetworkOnlyListBloc =
        IMyAccountDomainBlockNetworkOnlyListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var blocking = true;

    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        var domain = Provider.of<DomainBlock>(context, listen: false);
        await myAccountDomainBlockNetworkOnlyListBloc.removeDomainBlock(
          domain: domain.domain,
        );
        blocking = false;
        await paginationListBloc.refreshWithController();
      },
      builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
        blocking
            ? S.of(context).app_account_my_domainBlock_action_unblock
            : S.of(context).app_account_my_domainBlock_action_block,
        onPressed: onPressed,
        color: blocking ? fediUiColorTheme.mediumGrey : fediUiColorTheme.error,
        expanded: false,
      ),
    );
  }
}

void goToMyAccountDomainBlockListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountDomainBlockListPage(),
  );
}

MaterialPageRoute<void> createMyAccountDomainBlockListPage() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          MyAccountDomainBlockNetworkOnlyDomainListBloc.provideToContext(
        context,
        child:
            DisposableProvider<IMyAccountDomainBlockNetworkOnlyPaginationBloc>(
          create:
              MyAccountDomainBlockNetworkOnlyPaginationBloc.createFromContext,
          child: ProxyProvider<IMyAccountDomainBlockNetworkOnlyPaginationBloc,
              INetworkOnlyPleromaPaginationBloc<DomainBlock>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                INetworkOnlyPleromaPaginationBloc<DomainBlock>,
                INetworkOnlyPaginationBloc<PaginationPage<DomainBlock>,
                    DomainBlock>>(
              update: (context, value, previous) => value,
              child: NetworkOnlyPaginationBlocProxyProvider<
                  PaginationPage<DomainBlock>, DomainBlock>(
                child: MyAccountDomainBlockPaginationListBloc.provideToContext(
                  context,
                  loadFromCacheDuringInit: false,
                  child: MyAccountDomainBlockListPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
