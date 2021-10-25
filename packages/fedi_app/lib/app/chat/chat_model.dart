import 'package:fedi_app/app/account/account_model.dart';
import 'package:flutter/widgets.dart';

typedef ChatCallback = Function(BuildContext context, IChat chat);

abstract class IChat {
  int? get localId;

  String get remoteId;

  int get unread;

  DateTime? get updatedAt;

  List<IAccount> get accounts;
}
