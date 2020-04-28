import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountBloc extends DisposableOwner {
  static IAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountBloc>(context, listen: listen);

  IAccount get account;

  Stream<IAccount> get accountStream;

  String get acct => account.acct;

  Stream<String> get acctStream => accountStream.map((account) => account.acct);

  String get avatar => account.avatar;

  Stream<String> get avatarStream =>
      accountStream.map((account) => account.avatar);

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

  int get statusesCount => account.statusesCount;

  Stream<int> get statusesCountStream =>
      accountStream.map((account) => account.statusesCount);

  EmojiText get displayNameEmojiText =>
      EmojiText(text: account.displayName, emojis: account.emojis);

  Stream<EmojiText> get displayNameEmojiTextStream =>
      accountStream.map((account) =>
          EmojiText(text: account.displayName, emojis: account.emojis));

  String get displayName => account.displayName;

  Stream<String> get displayNameStream =>
      accountStream.map((account) => account.displayName);

  IPleromaAccountRelationship get accountRelationship;

  Stream<IPleromaAccountRelationship> get accountRelationshipStream;

  Future<IPleromaAccountRelationship> toggleFollow();

  Future<IPleromaAccountRelationship> toggleMute();

  Future<IPleromaAccountRelationship> togglePin();

  Future<IPleromaAccountRelationship> toggleBlock();

  Future report();

  Future<bool> refreshFromNetwork();
}
