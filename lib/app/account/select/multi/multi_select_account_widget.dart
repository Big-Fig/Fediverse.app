import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiSelectAccountWidget extends StatelessWidget {
  final AccountsListCallback accountsListSelectedCallback;

  const MultiSelectAccountWidget({@required this.accountsListSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var multiSelectAccountBloc =
        IMultiSelectAccountBloc.of(context, listen: false);
    return AccountPaginationListWidget(
      accountSelectedCallback: (_, __) {
        // nothing
      },
      accountActions: <Widget>[
        Builder(
          builder: (BuildContext context) {
            var account = Provider.of<IAccount>(context);
            return StreamBuilder<bool>(
              stream: multiSelectAccountBloc.isAccountSelectedStream(account),
              builder: (context, snapshot) {
                var isAccountSelected = snapshot.data == true;

                return FediIconInCircleTransparentButton(
                  FediIcons.check_circle,
                  color: isAccountSelected
                      ? FediColors.primaryColor
                      : FediColors.darkGrey,
                  onPressed: () {
                    if (isAccountSelected) {
                      multiSelectAccountBloc.removeAccountSelection(account);
                    } else {
                      multiSelectAccountBloc.addAccountSelection(account);
                    }
                  },
                );
              },
            );
          },
        ),
      ],
      key: PageStorageKey("MultiSelectAccountWidget"),
    );
  }
}
