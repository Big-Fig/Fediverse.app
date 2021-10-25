import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_model.dart';

import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class GuestMyAccountBloc extends DisposableOwner implements IMyAccountBloc {
  @override
  IAccount get account => throw UnimplementedError();

  @override
  Stream<IAccount> get accountStream => throw UnimplementedError();

  @override
  bool checkAccountIsMe(IAccount account) => false;

  @override
  bool checkIsChatMessageFromMe(IChatMessage chatMessage) => false;

  @override
  bool checkIsStatusFromMe(IStatus status) => false;

  @override
  Future<void> decreaseFollowingRequestCount() async {
    throw UnimplementedError();
  }

  @override
  UnifediApiAccess get instance => throw UnimplementedError();

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  bool get isLocalCacheExist => false;

  @override
  Future<IUnifediApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) {
    throw UnimplementedError();
  }

  @override
  IMyAccount? get myAccount => null;

  @override
  Stream<IMyAccount?> get myAccountStream => Stream.value(myAccount);

  @override
  Future<void> refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) {
    throw UnimplementedError();
  }

  @override
  IUnifediApiAccountRelationship? get relationship =>
      throw UnimplementedError();

  @override
  Stream<IUnifediApiAccountRelationship?>? get relationshipStream =>
      throw UnimplementedError();

  @override
  Uri? get remoteInstanceUriOrNull => throw UnimplementedError();

  @override
  Future<IUnifediApiAccountRelationship> subscribe() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleBlock() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleBlockDomain() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleFollow() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleMute() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> togglePin() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleSubscribe() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> unMute() {
    throw UnimplementedError();
  }

  @override
  Future<IUnifediApiAccountRelationship> unSubscribe() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateMyAccountByMyAccount(IMyAccount myAccount) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateMyAccountByMyUnifediApiAccount(
    IUnifediApiMyAccount unifediApiMyAccount,
  ) {
    throw UnimplementedError();
  }

  @override
  bool get isEndorsementSupported => false;

  @override
  bool get isSubscribeToAccountFeatureSupported => false;

  @override
  bool get isSupportChats => false;
}
