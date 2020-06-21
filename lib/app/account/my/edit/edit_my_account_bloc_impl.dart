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

// todo: default server config is 4, should be fetched from server
var _maximumPossibleCustomFieldsCount = 4;

class EditMyAccountBloc extends DisposableOwner implements IEditMyAccountBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;
  final int maximumPossibleCustomFieldsCount;

  @override
  EditMyAccountStringField displayNameField;

  @override
  EditMyAccountStringField noteField;

  @override
  EditMyAccountBoolField lockedField;

  final BehaviorSubject<bool> _customFieldsChangedSubject =
      BehaviorSubject.seeded(false);

  bool get customFieldsChanged => _customFieldsChangedSubject.value;

  Stream<bool> get customFieldsChangedStream =>
      _customFieldsChangedSubject.stream;

  @override
  List<EditMyAccountCustomField> get customFields => _customFieldsSubject.value;

  @override
  Stream<List<EditMyAccountCustomField>> get customFieldsStream =>
      _customFieldsSubject.stream;

  @override
  List<IEditMyAccountField> get allFields =>
      [displayNameField, noteField, lockedField, ...customFields];

  final BehaviorSubject<List<EditMyAccountCustomField>> _customFieldsSubject =
      BehaviorSubject.seeded([]);

  @override
  bool get isMaximumCustomFieldsCountReached =>
      customFields.length >= maximumPossibleCustomFieldsCount;

  @override
  Stream<bool> get isMaximumCustomFieldsCountReachedStream =>
      customFieldsStream.map((customFields) =>
          customFields.length >= maximumPossibleCustomFieldsCount);

  @override
  void addNewEmptyCustomField() {
    assert(!isMaximumCustomFieldsCountReached);
    List<int> possibleIndexes = [];

    for (var i = 0; i < maximumPossibleCustomFieldsCount; i++) {
      possibleIndexes.add(i);
    }

    var unusedIndex = possibleIndexes.firstWhere((index) {
      var found = customFields.firstWhere((field) => field.index == index,
          orElse: () => null);
      return found == null;
    });

    customFields.add(
      EditMyAccountCustomField(
        index: unusedIndex,
        valueField: EditMyAccountStringField(originValue: ""),
        nameField: EditMyAccountStringField(originValue: ""),
      ),
    );

    _customFieldsSubject.add(customFields);
    _customFieldsChangedSubject.add(true);
  }

  @override
  void removeCustomField(EditMyAccountCustomField field) {
    customFields.remove(field);
    _customFieldsSubject.add(customFields);
    _customFieldsChangedSubject.add(true);

    Future.delayed(Duration(seconds: 1), () {
      field.dispose();
    });
  }

  EditMyAccountBloc({
    @required this.myAccountBloc,
    @required this.pleromaMyAccountService,
    @required this.maximumPossibleCustomFieldsCount,
  }) {
    addDisposable(subject: _customFieldsChangedSubject);
    addDisposable(subject: _customFieldsSubject);

    displayNameField = EditMyAccountStringField(
        originValue: myAccountBloc.displayNameEmojiText.text);
    addDisposable(disposable: displayNameField);

    noteField = EditMyAccountStringField(originValue: myAccountBloc.note);
    addDisposable(disposable: noteField);
    lockedField =
        EditMyAccountBoolField(originValue: myAccountBloc.account.locked);
    addDisposable(disposable: lockedField);

    var fields = myAccountBloc.fields;

    for (int i = 0; i < maximumPossibleCustomFieldsCount; i++) {
      if (i < fields.length) {
        var field = fields[i];
        if (field.name?.isNotEmpty == true || field.value?.isNotEmpty == true) {
          customFields.add(EditMyAccountCustomField(
            index: i,
            nameField: EditMyAccountStringField(originValue: field.name),
            valueField:
                EditMyAccountStringField(originValue: field.valueAsRawUrl),
          ));
        }
      }
    }

    addDisposable(disposable: CustomDisposable(() {
      for (var customField in customFields) {
        customField.dispose();
      }
    }));
  }

  @override
  bool get isSomethingChanged =>
      allFields.map((field) => field.isChanged).fold(false,
          (previousValue, element) {
        return previousValue | element;
      }) ||
      customFieldsChanged;

  @override
  Stream<bool> get isSomethingChangedStream => Rx.combineLatestList([
        ...allFields.map((field) => field.isChangedStream),
        customFieldsChangedStream
      ]).map((isChangedList) =>
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
              IPleromaMyAccountService.of(context, listen: false),
          maximumPossibleCustomFieldsCount: _maximumPossibleCustomFieldsCount);
}
