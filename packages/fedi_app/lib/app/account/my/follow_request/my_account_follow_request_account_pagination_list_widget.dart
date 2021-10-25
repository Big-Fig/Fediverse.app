import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_big_list_item_widget.dart';
import 'package:fedi_app/app/account/my/follow_request/my_account_follow_request_network_only_account_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/list/fedi_list_tile.dart';
import 'package:fedi_app/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountFollowRequestAccountPaginationListWidget
    extends StatelessWidget {
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;

  const MyAccountFollowRequestAccountPaginationListWidget({
    Key? key,
    this.customLoadingWidget,
    this.customEmptyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        customEmptyWidget: customEmptyWidget,
        customLoadingWidget: customLoadingWidget,
        customItemBodyBuilder: (
          BuildContext context,
          AccountCallback? accountSelectedCallback,
          List<Widget>? accountActions,
        ) =>
            FediListTile(
          child: AccountBigListItemWidget(
            accountSelectedCallback: accountSelectedCallback,
            accountActions: accountActions,
          ),
        ),
        accountActions: const <Widget>[
          _MyAccountFollowRequestAccountPaginationListAcceptButtonWidget(),
          FediMediumHorizontalSpacer(),
          _MyAccountFollowRequestAccountPaginationListRejectButtonWidget(),
        ],
        accountSelectedCallback: null,
        key: const PageStorageKey(
          'MyAccountFollowRequestAccountPaginationListWidget',
        ),
      );
}

class _MyAccountFollowRequestAccountPaginationListRejectButtonWidget
    extends StatelessWidget {
  const _MyAccountFollowRequestAccountPaginationListRejectButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var myAccountFollowRequestNetworkOnlyAccountListBloc =
        IMyAccountFollowRequestNetworkOnlyAccountListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);

    return UnifediAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        var account = Provider.of<IAccount>(context, listen: false);
        await myAccountFollowRequestNetworkOnlyAccountListBloc
            .rejectFollowRequest(account: account);
        await paginationListBloc.refreshWithController();
      },
      builder: (BuildContext context, void Function()? onPressed) =>
          FediTransparentTextButtonWithBorder(
        S.of(context).app_account_my_followRequest_action_ignore,
        onPressed: onPressed,
        color: fediUiColorTheme.mediumGrey,
        expanded: false,
      ),
    );
  }
}

class _MyAccountFollowRequestAccountPaginationListAcceptButtonWidget
    extends StatelessWidget {
  const _MyAccountFollowRequestAccountPaginationListAcceptButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var myAccountFollowRequestNetworkOnlyAccountListBloc =
        IMyAccountFollowRequestNetworkOnlyAccountListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);

    return UnifediAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        var account = Provider.of<IAccount>(context, listen: false);
        await myAccountFollowRequestNetworkOnlyAccountListBloc
            .acceptFollowRequest(account: account);
        await paginationListBloc.refreshWithController();
      },
      builder: (BuildContext context, void Function()? onPressed) =>
          FediTransparentTextButtonWithBorder(
        S.of(context).app_account_my_followRequest_action_add,
        onPressed: onPressed,
        color: fediUiColorTheme.primary,
        expanded: false,
      ),
    );
  }
}
