import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:easy_dispose/easy_dispose.dart';

class MyAccountBloc extends IMyAccountBloc {
  static const selfActionError = SelfActionNotPossibleException();

  final IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final IAccountRepository accountRepository;

  @override
  final AuthInstance instance;

  @override
  bool get isLocalCacheExist => myAccount != null;

  MyAccountBloc({
    required this.myAccountLocalPreferenceBloc,
    required this.unifediApiMyAccountService,
    required this.accountRepository,
    required this.instance,
  }) {
    myAccountStream.listen(
      (myAccount) {
        if (myAccount != null) {
          accountRepository.upsertInRemoteType(
            myAccount.toUnifediApiAccount(),
          );
        }
      },
    ).disposeWith(this);
  }

  @override
  Stream<IMyAccount?> get myAccountStream =>
      myAccountLocalPreferenceBloc.stream;

  @override
  IMyAccount? get myAccount => myAccountLocalPreferenceBloc.value;

  @override
  // todo: fix
  Stream<IAccount> get accountStream =>
      myAccountStream.map((myAccount) => myAccount!);

  @override
  IAccount get account => myAccount!;

  @override
  Future<IUnifediApiAccountRelationship> toggleBlock() {
    throw selfActionError;
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleFollow() {
    throw selfActionError;
  }

  @override
  Future refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) async {
    var remoteMyAccount = await unifediApiMyAccountService.verifyMyCredentials();

    await updateMyAccountByMyUnifediApiAccount(remoteMyAccount);
  }

  @override
  bool checkAccountIsMe(IAccount account) =>
      myAccount!.remoteId == account.remoteId;

  @override
  bool checkIsStatusFromMe(IStatus status) =>
      myAccount!.remoteId == status.account.remoteId;

  @override
  IUnifediApiAccountRelationship get relationship => throw selfActionError;

  @override
  Stream<IUnifediApiAccountRelationship> get relationshipStream =>
      throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> togglePin() => throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> toggleBlockDomain() =>
      throw selfActionError;

  @override
  Future updateMyAccountByMyUnifediApiAccount(
    IUnifediApiMyAccount unifediApiMyAccount,
  ) async {
    await myAccountLocalPreferenceBloc.setValue(
      UnifediApiMyAccountWrapper(
        unifediApiAccount: unifediApiMyAccount.toUnifediApiMyAccount(),
      ),
    );
  }

  @override
  Future updateMyAccountByMyAccount(IMyAccount myAccount) async {
    await myAccountLocalPreferenceBloc.setValue(
      UnifediApiMyAccountWrapper(
        unifediApiAccount: myAccount.toUnifediApiMyAccount(),
      ),
    );
  }

  @override
  Future decreaseFollowingRequestCount() async {
    assert(followRequestsCount! > 0);
    await myAccountLocalPreferenceBloc.setValue(
      myAccountLocalPreferenceBloc.value!.toUnifediApiMyAccountWrapper()
          .copyWith(
            followRequestsCount: followRequestsCount! - 1,
          )
          .toUnifediApiMyAccountWrapper(),
    );
  }

  @override
  bool checkIsChatMessageFromMe(IChatMessage? chatMessage) {
    return myAccount!.remoteId == chatMessage!.accountRemoteId;
  }

  @override
  Future<IUnifediApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) =>
      throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> unMute() => throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> subscribe() => throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> toggleMute() => throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> toggleSubscribe() =>
      throw selfActionError;

  @override
  Future<IUnifediApiAccountRelationship> unSubscribe() => throw selfActionError;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
