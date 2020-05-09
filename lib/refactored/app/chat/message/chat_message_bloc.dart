import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/collapsible/collapsible_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageBloc implements Disposable {
  static IChatMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatMessageBloc>(context, listen: listen);

  IChatMessage get chatMessage;

  Stream<IChatMessage> get chatMessageStream;

  String get content;

  Stream<String> get contentStream;

  String get contentWithEmojis;

  Stream<String> get contentWithEmojisStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  String get remoteId;

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

  Future refreshFromNetwork();
}
