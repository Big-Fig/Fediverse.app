import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_model.dart';
import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountBloc extends IMyAccountBloc {
  static const selfActionError = SelfActionNotPossibleException();

  final IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;
  final IUnifediApiMyAccountService apiMyAccountService;
  final IAccountRepository accountRepository;

  @override
  final UnifediApiAccess instance;

  @override
  bool get isLocalCacheExist => myAccount != null;

  MyAccountBloc({
    required this.myAccountLocalPreferenceBloc,
    required this.apiMyAccountService,
    required this.accountRepository,
    required this.instance,
  }) {
    myAccountStream.listen(
      (myAccount) {
        if (myAccount != null) {
          // ignore: avoid-ignoring-return-values
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
  Future<void> refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) async {
    var remoteMyAccount = await apiMyAccountService.verifyMyCredentials();

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
  Future<void> updateMyAccountByMyUnifediApiAccount(
    IUnifediApiMyAccount unifediApiMyAccount,
  ) async {
    await myAccountLocalPreferenceBloc.setValue(
      UnifediApiMyAccountWrapper(
        unifediApiAccount: unifediApiMyAccount.toUnifediApiMyAccount(),
      ),
    );
  }

  @override
  Future<void> updateMyAccountByMyAccount(IMyAccount myAccount) async {
    var unifediApiMyAccountWrapper = UnifediApiMyAccountWrapper(
      unifediApiAccount: myAccount.toUnifediApiMyAccount(),
    );
    await myAccountLocalPreferenceBloc.setValue(
      unifediApiMyAccountWrapper,
    );
  }

  @override
  Future<void> decreaseFollowingRequestCount() async {
    assert(
      followRequestsCount! > 0,
      'cant decrease following request when it is not positive',
    );
    await myAccountLocalPreferenceBloc.setValue(
      myAccountLocalPreferenceBloc.value!
          .toUnifediApiMyAccountWrapper()
          .copyWithTemp(
            followRequestsCount: followRequestsCount! - 1,
          )
          .toUnifediApiMyAccountWrapper(),
    );
  }

  @override
  bool checkIsChatMessageFromMe(IChatMessage? chatMessage) =>
      myAccount!.remoteId == chatMessage!.accountRemoteId;

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

  @override
  bool get isEndorsementSupported => false;

  @override
  bool get isSubscribeToAccountFeatureSupported => false;
}
