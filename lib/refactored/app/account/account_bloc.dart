import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountBloc extends Disposable {
  static IAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountBloc>(context, listen: listen);

  IAccount get account;

  Stream<IAccount> get accountStream;

  String get acct;

  Stream<String> get acctStream;

  String get note;

  Stream<String> get noteStream;

  String get header;

  Stream<String> get headerStream;

  String get avatar;

  Stream<String> get avatarStream;

  String get displayName;

  Stream<String> get displayNameStream;

  List<IPleromaField> get fields;

  Stream<List<IPleromaField>> get fieldsStream;

  int get statusesCount;

  Stream<int> get statusesCountStream;

  int get followingCount;

  Stream<int> get followingCountStream;

  int get followersCount;

  Stream<int> get followersCountStream;

  IPleromaAccountRelationship get accountRelationship;

  Stream<IPleromaAccountRelationship> get accountRelationshipStream;

  Future<IPleromaAccountRelationship> requestToggleFollow();

  Future<IPleromaAccountRelationship> requestToggleMute();

  Future<IPleromaAccountRelationship> requestToggleBlock();

  Future requestReport();

  Future<bool> requestRefreshFromNetwork();

  EmojiText get displayNameEmojiText;

  Stream<EmojiText> get displayNameEmojiTextStream;
}
