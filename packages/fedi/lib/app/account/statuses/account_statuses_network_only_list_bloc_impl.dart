import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class AccountStatusesNetworkOnlyListBloc
    extends IStatusNetworkOnlyListBloc {
  final IAccount? account;
  final IUnifediApiAccountService unifediApiAccountService;

  AccountStatusesNetworkOnlyListBloc({
    required this.account,
    required this.unifediApiAccountService,
  }) : super();

  @override
  IUnifediApiService get unifediApi => unifediApiAccountService;
}
