import 'package:fedi_app/pagination/list/edit/edit_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditPaginationListBlocProxyProvider<TPage extends PaginationPage<TItem>,
    TItem> extends StatelessWidget {
  final Widget child;

  const EditPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditPaginationListBloc<TPage, TItem>,
          IPaginationListBloc<TPage, TItem>>(
        update: (context, value, _) => value,
        child: ProxyProvider<IEditPaginationListBloc<TPage, TItem>,
            IEditPaginationListBloc<PaginationPage<TItem>, TItem>>(
          update: (context, value, previous) => value,
          child: ProxyProvider<IEditPaginationListBloc<TPage, TItem>,
              IEditPaginationListBloc>(
            update: (context, value, previous) => value,
            child: PaginationListBlocProxyProvider<TPage, TItem>(
              child: child,
            ),
          ),
        ),
      );
}
