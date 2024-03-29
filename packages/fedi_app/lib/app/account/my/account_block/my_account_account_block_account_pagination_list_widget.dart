import 'package:fedi_app/app/account/my/account_block/my_account_account_block_action_button_widget.dart';
import 'package:fedi_app/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountBlockAccountPaginationListWidget extends StatelessWidget {
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;

  const MyAccountAccountBlockAccountPaginationListWidget({
    Key? key,
    this.customLoadingWidget,
    this.customEmptyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        customLoadingWidget: customLoadingWidget,
        customEmptyWidget: customEmptyWidget,
        accountActions: const <Widget>[
          _MyAccountAccountBlockAccountPaginationListRemoteAccountBlockActionWidget(),
        ],
        accountSelectedCallback: null,
        key: const PageStorageKey(
          'MyAccountAccountBlockAccountPaginationListWidget',
        ),
      );
}

class _MyAccountAccountBlockAccountPaginationListRemoteAccountBlockActionWidget
    extends StatelessWidget {
  const _MyAccountAccountBlockAccountPaginationListRemoteAccountBlockActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountAccountBlockNetworkOnlyAccountListBloc =
        IMyAccountAccountBlockNetworkOnlyAccountListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);

    return MyAccountAccountBlockActionButtonWidget(
      listBloc: myAccountAccountBlockNetworkOnlyAccountListBloc,
      paginationListBloc: paginationListBloc,
      defaultBlocking: true,
    );
  }
}
