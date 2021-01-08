import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountBloc extends DisposableOwner {
  static IAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountBloc>(context, listen: listen);

  IAccount get account;

  Stream<IAccount> get accountStream;

  String get remoteDomainOrNull;

  IPleromaAccountRelationship get relationship;

  Stream<IPleromaAccountRelationship> get relationshipStream;

  Future<IPleromaAccountRelationship> toggleFollow();

  Future<IPleromaAccountRelationship> toggleMute();


  Future<IPleromaAccountRelationship> mute({@required bool notifications});

  Future<IPleromaAccountRelationship> unMute();

  Future<IPleromaAccountRelationship> subscribe();

  Future<IPleromaAccountRelationship> unSubscribe();

  Future<IPleromaAccountRelationship> togglePin();

  Future<IPleromaAccountRelationship> toggleBlock();

  Future<IPleromaAccountRelationship> toggleSubscribe();

  Future<IPleromaAccountRelationship> toggleBlockDomain();

  Future<bool> refreshFromNetwork({
    @required bool isNeedPreFetchRelationship,
  });
}

extension IAccountBlocExtension on IAccountBloc {
  bool get isOnRemoteDomain => remoteDomainOrNull != null;

  String get acct => account.acct;

  Stream<String> get acctStream => accountStream.map((account) => account.acct);

  String get avatar => account?.avatar;

  Stream<String> get avatarStream =>
      accountStream.map((account) => account.avatar);

  String get pleromaBackgroundImage => account?.pleromaBackgroundImage;

  Stream<String> get pleromaBackgroundImageStream =>
      accountStream.map((account) => account.pleromaBackgroundImage);

  List<IPleromaField> get fields => account.fields;

  Stream<List<IPleromaField>> get fieldsStream =>
      accountStream.map((account) => account.fields);

  int get followersCount => account.followersCount;

  Stream<int> get followersCountStream =>
      accountStream.map((account) => account.followersCount);

  int get followingCount => account.followingCount;

  Stream<int> get followingCountStream =>
      accountStream.map((account) => account.followingCount);

  String get header => account.header;

  Stream<String> get headerStream =>
      accountStream.map((account) => account.header);

  String get note => account.note;

  Stream<String> get noteStream => accountStream.map((account) => account.note);

  EmojiText get noteEmojiText => account != null
      ? EmojiText(text: account.note, emojis: account.emojis)
      : null;

  Stream<EmojiText> get noteEmojiTextStream =>
      accountStream.map((account) => account != null
          ? EmojiText(text: account.note, emojis: account.emojis)
          : null);

  int get statusesCount => account.statusesCount;

  Stream<int> get statusesCountStream =>
      accountStream.map((account) => account.statusesCount);

  EmojiText get displayNameEmojiText => account != null
      ? EmojiText(text: account.displayName, emojis: account.emojis)
      : null;

  Stream<EmojiText> get displayNameEmojiTextStream =>
      accountStream.map((account) => account != null
          ? EmojiText(text: account.displayName, emojis: account.emojis)
          : null);

  String get displayName => account.displayName;

  Stream<String> get displayNameStream =>
      accountStream.map((account) => account.displayName);

  bool get relationshipBlocking => relationship?.blocking;

  Stream<bool> get relationshipBlockingStream =>
      relationshipStream.map((relationship) => relationship?.blocking);

  bool get relationshipBlockedBy => relationship?.blockedBy;

  Stream<bool> get relationshipBlockedByStream =>
      relationshipStream.map((relationship) => relationship?.blockedBy);

  bool get relationshipDomainBlocking => relationship?.domainBlocking;

  Stream<bool> get relationshipDomainBlockingStream =>
      relationshipStream.map((relationship) => relationship?.domainBlocking);

  bool get relationshipEndorsed => relationship?.endorsed;

  Stream<bool> get relationshipEndorsedStream =>
      relationshipStream.map((relationship) => relationship?.endorsed);

  bool get relationshipFollowedBy => relationship?.followedBy;

  Stream<bool> get relationshipFollowedByStream =>
      relationshipStream.map((relationship) => relationship?.followedBy);

  bool get relationshipFollowing => relationship?.following;

  Stream<bool> get relationshipFollowingStream =>
      relationshipStream.map((relationship) => relationship?.following);

  bool get relationshipSubscribing => relationship?.subscribing;

  Stream<bool> get relationshipSubscribingStream =>
      relationshipStream.map((relationship) => relationship?.subscribing);

  String get relationshipId => relationship?.id;

  Stream<String> get relationshipIdStream =>
      relationshipStream.map((relationship) => relationship?.id);

  bool get relationshipMuting => relationship?.muting;

  Stream<bool> get relationshipMutingStream =>
      relationshipStream.map((relationship) => relationship?.muting);

  bool get relationshipMutingNotifications => relationship?.mutingNotifications;

  Stream<bool> get relationshipMutingNotificationsStream => relationshipStream
      .map((relationship) => relationship?.mutingNotifications);

  bool get relationshipRequested => relationship?.requested;

  Stream<bool> get relationshipRequestedStream =>
      relationshipStream.map((relationship) => relationship?.requested);

  bool get relationshipShowingReblogs => relationship?.showingReblogs;

  Stream<bool> get relationshipShowingReblogsStream =>
      relationshipStream.map((relationship) => relationship?.showingReblogs);

  String get relationshipNote => relationship?.note;

  Stream<String> get relationshipNoteStream =>
      relationshipStream.map((relationship) => relationship?.note);
}
