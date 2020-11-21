import 'package:fedi/form/field/file/image/form_image_file_picker_or_url_field_bloc.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/form/group/pair/form_key_value_pair_field_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements IFormBloc {
  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  IFormOneTypeGroupBloc<IFormKeyValuePairFieldGroupBloc>
      get customFieldsGroupBloc;

  IFormImageFilePickerOrUrlFieldBloc get avatarField;

  IFormImageFilePickerOrUrlFieldBloc get headerField;

  IFormImageFilePickerOrUrlFieldBloc get backgroundField;

  IFormStringFieldBloc get displayNameField;

  IFormStringFieldBloc get noteField;

  IFormBoolFieldBloc get lockedField;

  Future submitChanges();
}
