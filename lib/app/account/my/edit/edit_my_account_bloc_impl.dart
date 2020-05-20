import 'dart:io';

import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class EditMyAccountBloc extends DisposableOwner implements IEditMyAccountBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;

  @override
  EditMyAccountStringField displayNameField;

  @override
  EditMyAccountStringField noteField;

  @override
  EditMyAccountBoolField lockedField;

  @override
  List<EditMyAccountCustomField> customFields = [];

  @override
  List<IEditMyAccountField> get allFields =>
      [displayNameField, noteField, lockedField, ...customFields];

  EditMyAccountBloc({
    @required this.myAccountBloc,
    @required this.pleromaMyAccountService,
  }) {
    displayNameField = EditMyAccountStringField(
        originValue: myAccountBloc.displayNameEmojiText.text);
    addDisposable(disposable: displayNameField);

    noteField = EditMyAccountStringField(originValue: myAccountBloc.note);
    addDisposable(disposable: noteField);
    lockedField =
        EditMyAccountBoolField(originValue: myAccountBloc.account.locked);
    addDisposable(disposable: lockedField);

    var fields = myAccountBloc.fields;
    // todo: default server config is 4, should be fetched from server
    var maximumPossibleCustomFieldsCount = 4;

    for (int i = 0; i < maximumPossibleCustomFieldsCount; i++) {
      if (i < fields.length) {
        var field = fields[i];

        customFields.add(EditMyAccountCustomField(
          index: i,
          nameField: EditMyAccountStringField(originValue: field.name),
          valueField: EditMyAccountStringField(originValue: field.value),
        ));
      } else {
        // add empty fields to edit
        customFields.add(EditMyAccountCustomField(
          index: i,
          nameField: EditMyAccountStringField(originValue: ""),
          valueField: EditMyAccountStringField(originValue: ""),
        ));
      }
    }

    addDisposable(disposable: CustomDisposable(() {
      for (var customField in customFields) {
        customField.dispose();
      }
    }));
  }

  @override
  bool get isSomethingChanged => allFields
          .map((field) => field.isChanged)
          .fold(false, (previousValue, element) {
        return previousValue | element;
      });

  @override
  Stream<bool> get isSomethingChangedStream =>
      Rx.combineLatestList(allFields.map((field) => field.isChangedStream)).map(
          (isChangedList) =>
              isChangedList.fold(false, (previousValue, element) {
                return previousValue | element;
              }));

  @override
  String get avatarImageUrl => myAccountBloc.avatar;

  @override
  Stream<String> get avatarImageUrlStream => myAccountBloc.avatarStream;

  @override
  String get headerImageUrl => myAccountBloc.header;

  @override
  Stream<String> get headerImageUrlStream => myAccountBloc.headerStream;

  @override
  Future submitChanges() async {
    Map<int, PleromaField> fieldsAttributes = {};
    customFields.forEach((customField) => fieldsAttributes[customField.index] =
        PleromaField(
            name: customField.nameField.currentValue,
            value: customField.valueField.currentValue));
    var remoteMyAccount =
        await pleromaMyAccountService.updateCredentials(PleromaMyAccountEdit(
      displayName: displayNameField.currentValue,
      note: noteField.currentValue,
      fieldsAttributes: fieldsAttributes,
      locked: lockedField.currentValue,
    ));

    await myAccountBloc.updateMyAccountByRemote(remoteMyAccount);
  }

  @override
  Future<bool> uploadAvatarImage(File file) {
    var pleromaMyAccountFilesRequest =
        PleromaMyAccountFilesRequest(avatar: file);
    return _updateFiles(pleromaMyAccountFilesRequest);
  }

  Future<bool> _updateFiles(
      PleromaMyAccountFilesRequest pleromaMyAccountFilesRequest) async {
    var remoteMyAccount =
        await pleromaMyAccountService.updateFiles(pleromaMyAccountFilesRequest);

    if (remoteMyAccount != null) {
      await myAccountBloc.updateMyAccountByRemote(remoteMyAccount);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> uploadHeaderImage(File file) {
    var pleromaMyAccountFilesRequest =
        PleromaMyAccountFilesRequest(header: file);
    return _updateFiles(pleromaMyAccountFilesRequest);
  }

  static EditMyAccountBloc createFromContext(BuildContext context) =>
      EditMyAccountBloc(
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          pleromaMyAccountService:
              IPleromaMyAccountService.of(context, listen: false));
}
