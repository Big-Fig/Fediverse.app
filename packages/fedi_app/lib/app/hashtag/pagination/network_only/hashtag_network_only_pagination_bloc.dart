import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHashtagNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<IHashtag> {
  static IHashtagNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IHashtagNetworkOnlyPaginationBloc>(context, listen: listen);
}
