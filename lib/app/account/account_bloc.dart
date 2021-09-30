import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccountBloc extends DisposableOwner
    implements IInstanceLocationBloc {
  bool get isEndorsementSupported;

  bool get isSubscribeToAccountFeatureSupported;

  bool get isSupportChats;

  static IAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountBloc>(context, listen: listen);

  IAccount get account;

  Stream<IAccount> get accountStream;

  IUnifediApiAccountRelationship? get relationship;

  Stream<IUnifediApiAccountRelationship?>? get relationshipStream;

  Future<IUnifediApiAccountRelationship> toggleFollow();

  Future<IUnifediApiAccountRelationship> toggleMute();

  Future<IUnifediApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  });

  Future<IUnifediApiAccountRelationship> unMute();

  Future<IUnifediApiAccountRelationship> subscribe();

  Future<IUnifediApiAccountRelationship> unSubscribe();

  Future<IUnifediApiAccountRelationship> togglePin();

  Future<IUnifediApiAccountRelationship> toggleBlock();

  Future<IUnifediApiAccountRelationship> toggleSubscribe();

  Future<IUnifediApiAccountRelationship> toggleBlockDomain();

  Future refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  });
}

extension IAccountBlocExtension on IAccountBloc {
  String get acct => account.acct;

  Stream<String> get acctStream => accountStream.map(
        (account) => account.acct,
      );

  String? get acctRemoteDomainOrNull => account.acctRemoteDomainOrNull;

  bool get isAcctRemoteDomainExist => account.isAcctRemoteDomainExist;

  String? get acctWithForcedRemoteInstanceHost =>
      calculateAcctOnRemoteHost(acct);

  Stream<String?> get acctWithForcedRemoteInstanceHostStream => acctStream.map(
        (acct) => calculateAcctOnRemoteHost(acct),
      );

  String? calculateAcctOnRemoteHost(String? acct) {
    var isLocal = instanceLocation == InstanceLocation.local;

    if (isLocal) {
      return acct;
    } else {
      if (acctRemoteDomainOrNull?.isNotEmpty == true) {
        return acct;
      } else {
        var remoteDomain = account.urlRemoteHostUri.host;

        return '$acct@$remoteDomain';
      }
    }
  }

  String? get avatar => account.avatar;

  Stream<String?> get avatarStream =>
      accountStream.map((account) => account.avatar);

  String? get backgroundImage => account.backgroundImage;

  Stream<String?> get backgroundImageStream =>
      accountStream.map((account) => account.backgroundImage);

  bool? get hideFavorites => account.hideFavorites;

  Stream<bool?> get hideFavoritesStream =>
      accountStream.map((account) => account.hideFavorites);

  bool? get hideFollowers => account.hideFollowers;

  Stream<bool?> get hideFollowersStream =>
      accountStream.map((account) => account.hideFollowers);

  bool? get hideFollowersCount => account.hideFollowersCount;

  Stream<bool?> get hideFollowersCountStream =>
      accountStream.map((account) => account.hideFollowersCount);

  bool? get hideFollows => account.hideFollows;

  Stream<bool?> get hideFollowsStream =>
      accountStream.map((account) => account.hideFollows);

  bool? get acceptsChatMessages => account.acceptsChatMessages;

  Stream<bool?> get acceptsChatMessagesStream =>
      accountStream.map((account) => account.acceptsChatMessages);

  bool? get hideFollowsCount => account.hideFollowsCount;

  Stream<bool?> get hideFollowsCountStream =>
      accountStream.map((account) => account.hideFollowsCount);

  List<IUnifediApiField> get fields => account.fields ?? [];

  Stream<List<IUnifediApiField>> get fieldsStream =>
      accountStream.map((account) => account.fields ?? []);

  int? get followersCount => account.followersCount;

  Stream<int?> get followersCountStream =>
      accountStream.map((account) => account.followersCount);

  int? get followingCount => account.followingCount;

  Stream<int?> get followingCountStream =>
      accountStream.map((account) => account.followingCount);

  String? get header => account.header;

  Stream<String?> get headerStream =>
      accountStream.map((account) => account.header);

  String? get note => account.note;

  Stream<String?> get noteStream =>
      accountStream.map((account) => account.note);

  EmojiText? get noteEmojiText => account.toNoteEmojiText();

  Stream<EmojiText?> get noteEmojiTextStream => accountStream.map(
        (account) => account.toNoteEmojiText(),
      );

  int? get statusesCount => account.statusesCount;

  Stream<int?> get statusesCountStream =>
      accountStream.map((account) => account.statusesCount);

  EmojiText? get displayNameEmojiText => account.toDisplayNameEmojiText();

  Stream<EmojiText?> get displayNameEmojiTextStream => accountStream.map(
        (account) => account.toDisplayNameEmojiText(),
      );

  String? get displayName => account.displayName;

  Stream<String?> get displayNameStream => accountStream.map(
        (account) => account.displayName,
      );

  bool? get relationshipBlocking => relationship?.blocking;

  Stream<bool?> get relationshipBlockingStream => relationshipStream!.map(
        (relationship) => relationship?.blocking,
      );

  bool? get relationshipBlockedBy => relationship?.blockedBy;

  Stream<bool?> get relationshipBlockedByStream => relationshipStream!.map(
        (relationship) => relationship?.blockedBy,
      );

  bool? get relationshipDomainBlocking => relationship?.domainBlocking;

  Stream<bool?> get relationshipDomainBlockingStream => relationshipStream!.map(
        (relationship) => relationship?.domainBlocking,
      );

  bool? get relationshipEndorsed => relationship?.endorsed;

  Stream<bool?> get relationshipEndorsedStream =>
      relationshipStream!.map((relationship) => relationship?.endorsed);

  bool? get relationshipFollowedBy => relationship?.followedBy;

  Stream<bool?> get relationshipFollowedByStream =>
      relationshipStream!.map((relationship) => relationship?.followedBy);

  bool? get relationshipFollowing => relationship?.following;

  Stream<bool?> get relationshipFollowingStream =>
      relationshipStream!.map((relationship) => relationship?.following);

  bool? get relationshipSubscribing => relationship?.subscribing;

  Stream<bool?> get relationshipSubscribingStream =>
      relationshipStream!.map((relationship) => relationship?.subscribing);

  String? get relationshipId => relationship?.id;

  Stream<String?> get relationshipIdStream =>
      relationshipStream!.map((relationship) => relationship?.id);

  bool? get relationshipMuting => relationship?.muting;

  Stream<bool?> get relationshipMutingStream =>
      relationshipStream!.map((relationship) => relationship?.muting);

  bool? get relationshipMutingNotifications =>
      relationship?.mutingNotifications;

  Stream<bool?> get relationshipMutingNotificationsStream => relationshipStream!
      .map((relationship) => relationship?.mutingNotifications);

  bool? get relationshipRequested => relationship?.requested;

  Stream<bool?> get relationshipRequestedStream =>
      relationshipStream!.map((relationship) => relationship?.requested);

  bool? get relationshipShowingReblogs => relationship?.showingReblogs;

  Stream<bool?> get relationshipShowingReblogsStream =>
      relationshipStream!.map((relationship) => relationship?.showingReblogs);

  String? get relationshipNote => relationship?.note;

  Stream<String?> get relationshipNoteStream =>
      relationshipStream!.map((relationship) => relationship?.note);
}

extension AccountEmojiTextExtension on IAccount {
  EmojiText? toNoteEmojiText() {
    if (note?.isNotEmpty == true) {
      return EmojiText(text: note!, emojis: emojis);
    } else {
      return null;
    }
  }

  EmojiText? toDisplayNameEmojiText() {
    if (displayName?.isNotEmpty == true) {
      return EmojiText(text: displayName!, emojis: emojis);
    } else {
      return null;
    }
  }
}
