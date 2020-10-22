import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
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
            conversationRemoteId: null,
            chatRemoteId: null);
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
  Future<bool> refreshFromNetwork({@required bool isNeedPreFetchRelationship}) async {
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
  IPleromaAccountRelationship get accountRelationship => throw selfActionError;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream =>
      throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> togglePin() => throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> toggleBlockDomain() =>
      throw selfActionError;

  @override
  void updateMyAccountByRemote(IPleromaMyAccount remoteMyAccount) {
    myAccountLocalPreferenceBloc
        .setValue(MyAccountRemoteWrapper(remoteAccount: remoteMyAccount));
  }

  @override
  bool checkIsChatMessageFromMe(IChatMessage chatMessage) {
    return myAccount.remoteId == chatMessage.account.remoteId;
  }

  @override
  String get remoteDomainOrNull => null;
}
