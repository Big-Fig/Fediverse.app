import 'dart:io';

import 'package:fedi/app/account/my/edit/edit_my_account_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements Disposable {
  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;

  String get avatarImageUrl;

  Stream<String> get avatarImageUrlStream;

  Future<bool> uploadAvatarImage(File file);

  String get headerImageUrl;

  Stream<String> get headerImageUrlStream;

  Future<bool> uploadHeaderImage(File file);

  List<IEditMyAccountField> get allFields;

  EditMyAccountStringField get displayNameField;

  EditMyAccountStringField get noteField;

  List<EditMyAccountCustomField> get customFields;

  EditMyAccountBoolField get lockedField;

  Future submitChanges();
}
