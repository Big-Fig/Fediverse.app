import 'package:fedi_app/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditPaginationSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PaginationSettings>
    implements IEditPaginationSettingsBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late PaginationPageSizeSingleFromListValueFormFieldBloc pageSizeFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        pageSizeFieldBloc,
      ];

  EditPaginationSettingsBloc({
    required this.paginationSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: paginationSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    pageSizeFieldBloc = PaginationPageSizeSingleFromListValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.pageSize,
    );

    addDisposable(pageSizeFieldBloc);

    onFormItemsChanged();
  }

  @override
  PaginationSettings calculateCurrentFormFieldsSettings() =>
      PaginationSettings.fromEnum(
        pageSize: pageSizeFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(PaginationSettings settings) async {
    pageSizeFieldBloc.changeCurrentValue(
      settings.pageSize,
    );
  }
}
