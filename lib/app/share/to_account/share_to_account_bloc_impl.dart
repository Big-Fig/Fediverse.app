import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc_impl.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/widgets.dart';

abstract class ShareToAccountBloc extends DisposableOwner
    implements IShareToAccountBloc {
  @override
  IShareSelectAccountBloc shareSelectAccountBloc;

  ShareToAccountBloc({
    @required IMyAccountBloc myAccountBloc,
    @required IPleromaAccountService pleromaAccountService,
    @required IAccountRepository accountRepository,
  }) {
    shareSelectAccountBloc = ShareSelectAccountBloc(
      myAccountBloc: myAccountBloc,
      accountRepository: accountRepository,
      pleromaAccountService: pleromaAccountService,
      customRemoteAccountListLoader: customRemoteAccountListLoader,
      customLocalAccountListLoader: customLocalAccountListLoader,
    );

    addDisposable(disposable: shareSelectAccountBloc);
  }

  Future<List<IPleromaAccount>> customRemoteAccountListLoader(
      {int limit, IAccount newerThan, IAccount olderThan});

  Future<List<IAccount>> customLocalAccountListLoader(
      {int limit, IAccount newerThan, IAccount olderThan});
}
