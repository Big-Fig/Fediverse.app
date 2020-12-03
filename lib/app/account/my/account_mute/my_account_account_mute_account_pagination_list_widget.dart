import 'package:fedi/app/account/my/account_mute/my_account_account_mute_action_button_widget.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteAccountPaginationListWidget extends StatelessWidget {
  final Widget customLoadingWidget;
  final Widget customEmptyWidget;

  const MyAccountAccountMuteAccountPaginationListWidget({
    this.customEmptyWidget,
    this.customLoadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      customEmptyWidget: customEmptyWidget,
      customLoadingWidget: customLoadingWidget,
      accountActions: <Widget>[
        _MyAccountAccountMuteAccountPaginationListRemoveActionWidget(),
      ],
      accountSelectedCallback: null,
      key: PageStorageKey("MyAccountAccountMuteAccountPaginationListWidget"),
    );
  }
}

class _MyAccountAccountMuteAccountPaginationListRemoveActionWidget
    extends StatelessWidget {
  const _MyAccountAccountMuteAccountPaginationListRemoveActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountAccountMuteNetworkOnlyAccountListBloc =
        IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);

    return MyAccountAccountMuteActionButtonWidget(
      listBloc: myAccountAccountMuteNetworkOnlyAccountListBloc,
      paginationListBloc: paginationListBloc,
      defaultMuting: true,
    );
  }
}
