import 'dart:async';

import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MyAccountBloc extends IMyAccountBloc {
  static final selfActionError = SelfActionNotPossibleException();

  final IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;
  final IPleromaMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;

  @override
  final AuthInstance instance;

  @override
  bool get isLocalCacheExist => account != null;

  MyAccountBloc({
    @required this.myAccountLocalPreferenceBloc,
    @required this.pleromaMyAccountService,
    @required this.accountRepository,
    @required this.instance,
  }) {
    addDisposable(streamSubscription: accountStream.listen((myAccount) {
      if (myAccount != null) {
        accountRepository.upsertRemoteAccount(
            mapLocalAccountToRemoteAccount(myAccount),
            conversationRemoteId: null);
      }
    }));
  }

  IMyAccount get myAccount => myAccountLocalPreferenceBloc.value;

  @override
  Stream<IAccount> get accountStream => myAccountLocalPreferenceBloc.stream;

  @override
  IAccount get account => myAccount;

  @override
  Future report() {
    throw selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlock() {
    throw selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> toggleFollow() {
    throw selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> toggleMute() {
    throw selfActionError;
  }

  @override
  Future<bool> refreshFromNetwork() async {
    if (pleromaMyAccountService.isApiReadyToUse) {
      var remoteMyAccount = await pleromaMyAccountService.verifyCredentials();

      var success = remoteMyAccount != null;
      if (success) {
        updateMyAccountByRemote(remoteMyAccount);
      }
      return success;
    } else {
      return false;
    }
  }

  @override
  bool checkAccountIsMe(IAccount account) {
    return myAccount.remoteId == account.remoteId;
  }

  @override
  bool checkIsStatusFromMe(IStatus status) {
    return myAccount.remoteId == status.account.remoteId;
  }

  @override
  List<IAccount> excludeMyAccountFromList(List<IAccount> accounts) =>
      accounts?.where((account) => !checkAccountIsMe(account))?.toList();

  @override
  IPleromaAccountRelationship get accountRelationship => throw selfActionError;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream =>
      throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> togglePin() => throw selfActionError;

  @override
  updateMyAccountByRemote(IPleromaMyAccount remoteMyAccount) {
    myAccountLocalPreferenceBloc
        .setValue(MyAccountRemoteWrapper(remoteAccount: remoteMyAccount));
  }
}
