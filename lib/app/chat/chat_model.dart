import 'package:fedi/app/account/account_model.dart';
import 'package:flutter/widgets.dart';

typedef ChatCallback = Function(BuildContext context, IChat chat);

abstract class IChat {
  int? get localId;

  String get remoteId;

  int? get unread;

  DateTime? get updatedAt;

  List<IAccount> get accounts;

  IChat copyWith({
    int? id,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    List<IAccount>? accounts,
  });
}
