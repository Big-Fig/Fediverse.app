import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IHashtagNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IHashtag>, IHashtagListBloc {
  static IHashtagNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IHashtagNetworkOnlyListBloc>(context, listen: listen);

  @override
  IUnifediApiService get unifediApi;
}
