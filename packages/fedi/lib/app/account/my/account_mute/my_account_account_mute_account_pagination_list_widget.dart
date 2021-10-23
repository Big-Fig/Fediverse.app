import 'package:fedi/app/account/my/account_mute/action/my_account_account_mute_action_list_widget.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteAccountPaginationListWidget extends StatelessWidget {
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;

  const MyAccountAccountMuteAccountPaginationListWidget({
    Key? key,
    this.customEmptyWidget,
    this.customLoadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        customEmptyWidget: customEmptyWidget,
        customLoadingWidget: customLoadingWidget,
        isNeedPreFetchRelationship: true,
        accountActions: const <Widget>[
          _MyAccountAccountMuteAccountPaginationListRemoveActionWidget(),
        ],
        accountSelectedCallback: null,
        key: const PageStorageKey(
          'MyAccountAccountMuteAccountPaginationListWidget',
        ),
      );
}

class _MyAccountAccountMuteAccountPaginationListRemoveActionWidget
    extends StatelessWidget {
  const _MyAccountAccountMuteAccountPaginationListRemoveActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MyAccountAccountMuteActionListWidget(
        defaultMuting: true,
      );
}
