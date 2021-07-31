import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class AccountStatusesNetworkOnlyListBloc
    extends IStatusNetworkOnlyListBloc {
  final IAccount? account;
  final IPleromaApiAccountService pleromaAccountService;

  AccountStatusesNetworkOnlyListBloc({
    required this.account,
    required this.pleromaAccountService,
  }) : super();

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;
}
