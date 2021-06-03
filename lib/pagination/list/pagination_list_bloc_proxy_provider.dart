import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PaginationListBlocProxyProvider<TPage extends PaginationPage<TItem>,
    TItem> extends StatelessWidget {
  final Widget child;

  PaginationListBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPaginationListBloc<TPage, TItem>,
        IPaginationListBloc<PaginationPage<TItem>, TItem>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IPaginationListBloc<TPage, TItem>,
          IPaginationListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
