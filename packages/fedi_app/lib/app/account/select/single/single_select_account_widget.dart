import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelectAccountWidget extends StatelessWidget {
  final AccountCallback? accountSelectedCallback;
  final List<Widget>? accountActions;
  final bool isNeedPreFetchRelationship;
  final EdgeInsets itemPadding;

  final bool? alwaysShowHeader;
  final Widget? header;
  final bool? alwaysShowFooter;
  final Widget? footer;

  const SingleSelectAccountWidget({
    Key? key,
    required this.accountSelectedCallback,
    this.accountActions,
    this.isNeedPreFetchRelationship = false,
    this.itemPadding = FediPadding.allMediumPadding,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        accountActions: accountActions,
        accountSelectedCallback: (context, account) {
          if (accountSelectedCallback != null) {
            var selectAccountListBloc =
                ISelectAccountListBloc.of(context, listen: false);

            // ignore: cascade_invocations
            selectAccountListBloc.onAccountSelected(account);
            accountSelectedCallback!(context, account);
          }
        },
        itemPadding: itemPadding,
        key: const PageStorageKey('SingleSelectAccountWidget'),
        isNeedPreFetchRelationship: isNeedPreFetchRelationship,
        header: header,
        footer: footer,
        alwaysShowHeader: alwaysShowHeader,
        alwaysShowFooter: alwaysShowFooter,
      );
}
