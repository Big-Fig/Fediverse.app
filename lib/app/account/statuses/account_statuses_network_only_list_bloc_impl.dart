import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';

abstract class AccountStatusesNetworkOnlyListBloc
    extends IStatusNetworkOnlyListBloc {
  final IAccount? account;
  final IPleromaAccountService pleromaAccountService;

  AccountStatusesNetworkOnlyListBloc({
    required this.account,
    required this.pleromaAccountService,
  }) : super();

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;
}
