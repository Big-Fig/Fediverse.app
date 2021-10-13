import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPaginationListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  HashtagPaginationListBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IHashtagPaginationListBloc,
          IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IHashtagPaginationListBloc, IPaginationListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
