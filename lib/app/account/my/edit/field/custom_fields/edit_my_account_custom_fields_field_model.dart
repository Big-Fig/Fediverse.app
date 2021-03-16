import 'package:fedi/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:flutter/widgets.dart';

class EditMyAccountCustomFieldsItemFieldData {
  final ILinkPairFormGroupBloc customField;
  final ILinkPairFormGroupBloc? nextCustomField;
  final int index;

  EditMyAccountCustomFieldsItemFieldData({
    required this.customField,
    required this.nextCustomField,
    required this.index,
  });

  int get number => index + 1;

  @override
  String toString() => 'EditMyAccountCustomFieldsItemFieldData{'
      'customField: $customField,'
      ' nextCustomField: $nextCustomField, index: $index}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditMyAccountCustomFieldsItemFieldData &&
          runtimeType == other.runtimeType &&
          customField == other.customField &&
          nextCustomField == other.nextCustomField &&
          index == other.index;

  @override
  int get hashCode =>
      customField.hashCode ^ nextCustomField.hashCode ^ index.hashCode;
}
