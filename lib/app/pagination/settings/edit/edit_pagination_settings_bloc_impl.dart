import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/edit/edit_pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditPaginationSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PaginationSettings>
    implements IEditPaginationSettingsBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  @override
  PaginationPageSizeSingleFromListValueFormFieldBloc pageSizeFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        pageSizeFieldBloc,
      ];

  EditPaginationSettingsBloc({
    @required this.paginationSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
  }) : super(
          globalOrInstanceSettingsBloc: paginationSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
        ) {
    pageSizeFieldBloc = PaginationPageSizeSingleFromListValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.pageSizeAsUiSettingsFontSize,
    );

    addDisposable(disposable: pageSizeFieldBloc);

    onItemsChanged();
  }

  @override
  PaginationSettings calculateCurrentFormFieldsSettings() => PaginationSettings(
        pageSize: pageSizeFieldBloc.currentValue?.toJsonValue(),
      );

  @override
  Future fillSettingsToFormFields(PaginationSettings settings) async {
    pageSizeFieldBloc.changeCurrentValue(
      settings.pageSizeAsUiSettingsFontSize,
    );
  }
}
