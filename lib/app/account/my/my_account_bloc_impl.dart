import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';

class MyAccountBloc extends IMyAccountBloc {
  static final selfActionError = const SelfActionNotPossibleException();

  final IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;
  final IPleromaMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;

  @override
  final AuthInstance instance;

  @override
  bool get isLocalCacheExist => myAccount != null;

  MyAccountBloc({
    required this.myAccountLocalPreferenceBloc,
    required this.pleromaMyAccountService,
    required this.accountRepository,
    required this.instance,
  }) {
    addDisposable(
      streamSubscription: myAccountStream.listen(
        (myAccount) {
          if (myAccount != null) {
            accountRepository.upsertInRemoteType(
              myAccount.toPleromaAccount(),
            );
          }
        },
      ),
    );
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
  Future<IPleromaAccountRelationship> toggleBlock() {
    throw selfActionError;
  }

  @override
  Future<IPleromaAccountRelationship> toggleFollow() {
    throw selfActionError;
  }

  @override
  Future refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) async {
    var remoteMyAccount = await pleromaMyAccountService.verifyCredentials();

    await updateMyAccountByMyPleromaAccount(remoteMyAccount);
  }

  @override
  bool checkAccountIsMe(IAccount account) =>
      myAccount!.remoteId == account.remoteId;

  @override
  bool checkIsStatusFromMe(IStatus status) =>
      myAccount!.remoteId == status.account.remoteId;

  @override
  IPleromaAccountRelationship get relationship => throw selfActionError;

  @override
  Stream<IPleromaAccountRelationship> get relationshipStream =>
      throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> togglePin() => throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> toggleBlockDomain() =>
      throw selfActionError;

  @override
  Future updateMyAccountByMyPleromaAccount(
    IPleromaMyAccount pleromaMyAccount,
  ) async {
    await myAccountLocalPreferenceBloc.setValue(
      PleromaMyAccountWrapper(
        pleromaAccount: pleromaMyAccount.toPleromaMyAccount(),
      ),
    );
  }

  @override
  Future updateMyAccountByMyAccount(IMyAccount myAccount) async {
    await myAccountLocalPreferenceBloc.setValue(
      PleromaMyAccountWrapper(
        pleromaAccount: myAccount.toPleromaMyAccount(),
      ),
    );
  }

  @override
  Future decreaseFollowingRequestCount() async {
    assert(followRequestsCount! > 0);
    await myAccountLocalPreferenceBloc.setValue(
      myAccountLocalPreferenceBloc.value!
          .copyWith(
            followRequestsCount: followRequestsCount! - 1,
          )
          .toPleromaMyAccountWrapper(),
    );
  }

  @override
  bool checkIsChatMessageFromMe(IChatMessage? chatMessage) {
    return myAccount!.remoteId == chatMessage!.accountRemoteId;
  }

  @override
  Future<IPleromaAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) =>
      throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> unMute() => throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> subscribe() => throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> toggleMute() => throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> toggleSubscribe() =>
      throw selfActionError;

  @override
  Future<IPleromaAccountRelationship> unSubscribe() => throw selfActionError;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
