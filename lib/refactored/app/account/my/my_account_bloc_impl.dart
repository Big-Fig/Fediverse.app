import 'dart:async';

import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';

final _selfActionError =
    UnimplementedError("You can't perform this action by yourself");

class MyAccountBloc extends DisposableOwner implements IMyAccountBloc {
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
  String get acct => account.acct;

  @override
  Stream<String> get acctStream => accountStream.map((account) => account.acct);

  @override
  String get avatar => account.avatar;

  @override
  Stream<String> get avatarStream =>
      accountStream.map((account) => account.avatar);

  @override
  List<IPleromaField> get fields => account.fields;

  @override
  Stream<List<IPleromaField>> get fieldsStream =>
      accountStream.map((account) => account.fields);

  @override
  int get followersCount => account.followersCount;

  @override
  Stream<int> get followersCountStream =>
      accountStream.map((account) => account.followersCount);

  @override
  int get followingCount => account.followingCount;

  @override
  Stream<int> get followingCountStream =>
      accountStream.map((account) => account.followingCount);

  @override
  String get header => account.header;

  @override
  Stream<String> get headerStream =>
      accountStream.map((account) => account.header);

  @override
  String get note => account.note;

  @override
  Stream<String> get noteStream => accountStream.map((account) => account.note);

  @override
  int get statusesCount => account.statusesCount;

  @override
  Stream<int> get statusesCountStream =>
      accountStream.map((account) => account.statusesCount);

  @override
  EmojiText get displayNameEmojiText =>
      EmojiText(text: account.displayName, emojis: account.emojis);

  @override
  Stream<EmojiText> get displayNameEmojiTextStream =>
      accountStream.map((account) =>
          EmojiText(text: account.displayName, emojis: account.emojis));

  @override
  bool get isMyAccount => true;

  @override
  Future requestReport() {
    throw _selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> requestToggleBlock() {
    throw _selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> requestToggleFollow() {
    throw _selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> requestToggleMute() {
    throw _selfActionError;
  }

  @override
  Future<bool> requestRefreshFromNetwork() async {
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
  bool checkStatusIsFromMe(IStatus status) {
    return myAccount.remoteId == status.account.remoteId;
  }

  @override
  List<IAccount> excludeMyAccountFromList(List<IAccount> accounts) =>
      accounts?.where((account) => !checkAccountIsMe(account))?.toList();

  @override
  IPleromaAccountRelationship get accountRelationship => throw _selfActionError;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream =>
      throw _selfActionError;

  @override
  updateMyAccountByRemote(IPleromaMyAccount remoteMyAccount) {
    myAccountLocalPreferenceBloc
        .setValue(MyAccountRemoteWrapper(remoteAccount: remoteMyAccount));
  }
}
