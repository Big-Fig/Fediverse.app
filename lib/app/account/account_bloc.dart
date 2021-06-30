import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountBloc extends DisposableOwner
    implements IInstanceLocationBloc {
  static IAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountBloc>(context, listen: listen);

  IAccount get account;

  Stream<IAccount> get accountStream;

  IPleromaApiAccountRelationship? get relationship;

  Stream<IPleromaApiAccountRelationship?>? get relationshipStream;

  Future<IPleromaApiAccountRelationship> toggleFollow();

  Future<IPleromaApiAccountRelationship> toggleMute();

  Future<IPleromaApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  });

  Future<IPleromaApiAccountRelationship> unMute();

  Future<IPleromaApiAccountRelationship> subscribe();

  Future<IPleromaApiAccountRelationship> unSubscribe();

  Future<IPleromaApiAccountRelationship> togglePin();

  Future<IPleromaApiAccountRelationship> toggleBlock();

  Future<IPleromaApiAccountRelationship> toggleSubscribe();

  Future<IPleromaApiAccountRelationship> toggleBlockDomain();

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

  String? get pleromaBackgroundImage => account.pleromaBackgroundImage;

  Stream<String?> get pleromaBackgroundImageStream =>
      accountStream.map((account) => account.pleromaBackgroundImage);

  bool? get pleromaHideFavorites => account.pleromaHideFavorites;

  Stream<bool?> get pleromaHideFavoritesStream =>
      accountStream.map((account) => account.pleromaHideFavorites);

  bool? get pleromaHideFollowers => account.pleromaHideFollowers;

  Stream<bool?> get pleromaHideFollowersStream =>
      accountStream.map((account) => account.pleromaHideFollowers);

  bool? get pleromaHideFollowersCount => account.pleromaHideFollowersCount;

  Stream<bool?> get pleromaHideFollowersCountStream =>
      accountStream.map((account) => account.pleromaHideFollowersCount);

  bool? get pleromaHideFollows => account.pleromaHideFollows;

  Stream<bool?> get pleromaHideFollowsStream =>
      accountStream.map((account) => account.pleromaHideFollows);

  bool? get pleromaAcceptsChatMessages => account.pleromaAcceptsChatMessages;

  Stream<bool?> get pleromaAcceptsChatMessagesStream =>
      accountStream.map((account) => account.pleromaAcceptsChatMessages);

  bool? get pleromaHideFollowsCount => account.pleromaHideFollowsCount;

  Stream<bool?> get pleromaHideFollowsCountStream =>
      accountStream.map((account) => account.pleromaHideFollowsCount);

  List<IPleromaApiField> get fields => account.fields ?? [];

  Stream<List<IPleromaApiField>> get fieldsStream =>
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
