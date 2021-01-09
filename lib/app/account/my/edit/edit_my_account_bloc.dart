import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/pair/key_value_pair_form_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements IFormBloc {
  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc> get customFieldsGroupBloc;

  IImageFilePickerOrUrlFormFieldBloc get avatarField;

  IImageFilePickerOrUrlFormFieldBloc get headerField;

  IImageFilePickerOrUrlFormFieldBloc get backgroundField;

  IStringValueFormFieldBloc get displayNameField;

  IStringValueFormFieldBloc get noteField;

  IBoolValueFormFieldBloc get lockedField;

  IBoolValueFormFieldBloc get discoverableField;

  IBoolValueFormFieldBloc get hideFollowersField;

  IBoolValueFormFieldBloc get hideFavouritesField;

  IBoolValueFormFieldBloc get hideFollowersCountField;

  IBoolValueFormFieldBloc get hideFollowsField;

  IBoolValueFormFieldBloc get hideFollowsCountField;

  IBoolValueFormFieldBloc get noRichTextField;

  IBoolValueFormFieldBloc get showRoleField;

  IBoolValueFormFieldBloc get skipThreadContainmentField;

  IBoolValueFormFieldBloc get allowFollowingMoveField;

  IBoolValueFormFieldBloc get acceptsChatMessagesField;

  IBoolValueFormFieldBloc get botField;

  Future submitChanges();
}
