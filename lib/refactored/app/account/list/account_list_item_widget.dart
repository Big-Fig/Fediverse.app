import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/acct/account_acct_widget.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_list_item_widget.dart");

class AccountListItemWidget extends StatelessWidget {
  final AccountSelectedCallback accountSelectedCallback;

  const AccountListItemWidget({
    @required this.accountSelectedCallback,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    _logger.finest(() => "build ${accountBloc.acct}");

    return GestureDetector(
      onTap: () {
        if (accountSelectedCallback != null) {
          accountSelectedCallback(accountBloc.account);
        }
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const AccountAvatarWidget(
                        imageSize: 40,
                        progressSize: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const AccountAcctWidget()
                    ],
                  ),
                  const Spacer(),
                  // NO MORE BUTTON
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
