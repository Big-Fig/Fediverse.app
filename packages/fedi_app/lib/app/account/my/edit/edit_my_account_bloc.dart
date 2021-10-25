import 'package:fedi_app/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:fedi_app/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi_app/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMyAccountBloc implements IFormBloc {
  static IEditMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditMyAccountBloc>(context, listen: listen);

  IOneTypeFormGroupBloc<ILinkPairFormGroupBloc> get customFieldsGroupBloc;

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

  Future<void> submitChanges();
}
