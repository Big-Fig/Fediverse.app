import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/list/account_list_service.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service_impl.dart';
import 'package:fedi/refactored/app/account/select/select_account_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectAccountPage extends StatelessWidget {
  final AccountSelectedCallback accountSelectedCallback;

  SelectAccountPage({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: localization
      appBar: AppBar(title: Text("Select user")),
      body: SafeArea(
        child: SelectAccountWidget(
          accountSelectedCallback: accountSelectedCallback,
        ),
      ),
    );
  }
}

void goToSelectAccountPage(BuildContext context,
    {@required AccountSelectedCallback accountSelectedCallback,
    @required bool excludeMyAccount}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<ISelectAccountListService>(
            create: (context) => SelectAccountListService.createFromContext(
                context,
                excludeMyAccount: excludeMyAccount),
            child: Provider<IAccountListService>(
              create: (context) =>
                  ISelectAccountListService.of(context, listen: false),
              child: DisposableProvider<IAccountPaginationBloc>(
                create: (context) => AccountPaginationBloc(
                  listService: IAccountListService.of(context, listen: false),
                  itemsCountPerPage: 20,
                  maximumCachedPagesCount: null,
                ),
                child: DisposableProvider<IAccountPaginationListBloc>(
                  create: (context) => AccountPaginationListBloc(
                      paginationBloc:
                          IAccountPaginationBloc.of(context, listen: false)),
                  child: SelectAccountPage(
                      accountSelectedCallback: accountSelectedCallback),
                ),
              ),
            ))),
  );
}
