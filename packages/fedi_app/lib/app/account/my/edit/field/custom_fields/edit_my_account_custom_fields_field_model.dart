import 'package:fedi_app/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_my_account_custom_fields_field_model.freezed.dart';

@freezed
class EditMyAccountCustomFieldsItemFieldData
    with _$EditMyAccountCustomFieldsItemFieldData {
  const EditMyAccountCustomFieldsItemFieldData._();

  const factory EditMyAccountCustomFieldsItemFieldData({
    required ILinkPairFormGroupBloc customField,
    required ILinkPairFormGroupBloc? nextCustomField,
    required int index,
  }) = _EditMyAccountCustomFieldsItemFieldData;

  int get number => index + 1;
}
