import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPaginationListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const HashtagPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

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
