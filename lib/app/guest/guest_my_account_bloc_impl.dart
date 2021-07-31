import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class GuestMyAccountBloc extends DisposableOwner implements IMyAccountBloc {
  @override
  IAccount get account => throw UnimplementedError();

  @override
  Stream<IAccount> get accountStream => throw UnimplementedError();

  @override
  bool checkAccountIsMe(IAccount account) {
    return false;
  }

  @override
  bool checkIsChatMessageFromMe(IChatMessage chatMessage) {
    return false;
  }

  @override
  bool checkIsStatusFromMe(IStatus status) {
    return false;
  }

  @override
  Future decreaseFollowingRequestCount() async {
    throw UnimplementedError();
  }

  @override
  AuthInstance get instance => throw UnimplementedError();

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  bool get isLocalCacheExist => false;

  @override
  Future<IPleromaApiAccountRelationship> mute({
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
  String? get noteUnescaped => null;

  @override
  Future refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) {
    throw UnimplementedError();
  }

  @override
  IPleromaApiAccountRelationship? get relationship =>
      throw UnimplementedError();

  @override
  Stream<IPleromaApiAccountRelationship?>? get relationshipStream =>
      throw UnimplementedError();

  @override
  Uri? get remoteInstanceUriOrNull => throw UnimplementedError();

  @override
  Future<IPleromaApiAccountRelationship> subscribe() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> toggleBlock() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> toggleBlockDomain() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> toggleFollow() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> toggleMute() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> togglePin() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> toggleSubscribe() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> unMute() {
    throw UnimplementedError();
  }

  @override
  Future<IPleromaApiAccountRelationship> unSubscribe() {
    throw UnimplementedError();
  }

  @override
  Future updateMyAccountByMyAccount(IMyAccount myAccount) {
    throw UnimplementedError();
  }

  @override
  Future updateMyAccountByMyPleromaAccount(
    IPleromaApiMyAccount pleromaMyAccount,
  ) {
    throw UnimplementedError();
  }
}
