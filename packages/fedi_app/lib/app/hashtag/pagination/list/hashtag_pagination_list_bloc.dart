import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHashtagPaginationListBloc
    implements IPaginationListBloc<PaginationPage<IHashtag>, IHashtag> {
  static IHashtagPaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IHashtagPaginationListBloc>(context, listen: listen);
}
