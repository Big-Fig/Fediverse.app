import 'dart:io';

import 'package:fedi/app/account/my/edit/edit_my_account_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements Disposable {
  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;

  MediaImageSource get avatarImageSource;

  Stream<MediaImageSource> get avatarImageSourceStream;

  Future changeAvatarImage(File file);

  MediaImageSource get headerImageSource;

  Stream<MediaImageSource> get headerImageSourceStream;

  Future changeHeaderImage(File file);

  List<IEditMyAccountField> get allFields;

  EditMyAccountStringField get displayNameField;

  EditMyAccountStringField get noteField;

  List<EditMyAccountCustomField> get customFields;

  Stream<List<EditMyAccountCustomField>> get customFieldsStream;

  bool get isMaximumCustomFieldsCountReached;

  Stream<bool> get isMaximumCustomFieldsCountReachedStream;

  void addNewEmptyCustomField();

  void removeCustomField(EditMyAccountCustomField field);

  EditMyAccountBoolField get lockedField;

  Future submitChanges();
}
