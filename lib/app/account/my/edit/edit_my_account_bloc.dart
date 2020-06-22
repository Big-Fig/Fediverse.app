import 'package:fedi/ui/form/form_bloc.dart';
import 'package:fedi/ui/form/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/form_field_group_bloc.dart';
import 'package:fedi/ui/form/form_image_file_picker_or_url_field_bloc.dart';
import 'package:fedi/ui/form/form_link_pair_field_bloc.dart';
import 'package:fedi/ui/form/form_string_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements IFormBloc {

  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  IFormFieldGroupBloc<IFormLinkPairFieldBloc> get customFieldsGroupBloc;

  IFormImageFilePickerOrUrlFieldBloc get avatarField;

  IFormImageFilePickerOrUrlFieldBloc get headerField;

  IFormStringFieldBloc get displayNameField;

  IFormStringFieldBloc get noteField;

  IFormBoolFieldBloc get lockedField;

  Future submitChanges();
}
