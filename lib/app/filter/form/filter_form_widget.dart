import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_widget.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/date_time/duration_date_time_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilterFormWidget extends StatelessWidget {
  const FilterFormWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _FilterFormPhraseFieldWidget(),
        const _FilterFormContextFieldWidget(),
        const _FilterFormIrreversibleFieldWidget(),
        const _FilterFormWholeWordFieldWidget(),
        const _FilterFormExpiresInFieldWidget(),
      ],
    );
  }
}

class _FilterFormExpiresInFieldWidget extends StatelessWidget {
  const _FilterFormExpiresInFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterFormBloc, IDurationDateTimeValueFormFieldBloc?>(
      update: (context, value, previous) => value.expiresInField,
      child: DurationDateTimeValueFormFieldRowWidget(
        label: S.of(context).app_filter_edit_field_expiresIn_label,
        description: S.of(context).app_filter_edit_field_expiresIn_description,
        descriptionOnDisabled:
            S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
        negativeValue: S.of(context).app_filter_expired,
      ),
    );
  }
}

class _FilterFormContextFieldWidget extends StatelessWidget {
  const _FilterFormContextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterFormBloc,
        IFilterContextMultiSelectFromListValueFormFieldBloc>(
      update: (context, value, previous) => value.contextField,
      child: FilterContextMultiSelectFromListValueFormFieldWidget(
        label: S.of(context).app_filter_edit_field_context_label,
        description: S.of(context).app_filter_edit_field_context_description,
      ),
    );
  }
}

class _FilterFormIrreversibleFieldWidget extends StatelessWidget {
  const _FilterFormIrreversibleFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterFormBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.irreversibleField,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_filter_edit_field_irreversible_label,
        description:
            S.of(context).app_filter_edit_field_irreversible_description,
      ),
    );
  }
}

class _FilterFormWholeWordFieldWidget extends StatelessWidget {
  const _FilterFormWholeWordFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterFormBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.wholeWordField,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_filter_edit_field_wholeWord_label,
        description: S.of(context).app_filter_edit_field_wholeWord_description,
        descriptionOnDisabled:
            S.of(context).app_filter_edit_field_wholeWord_error_invalid_phrase,
      ),
    );
  }
}

class _FilterFormPhraseFieldWidget extends StatelessWidget {
  const _FilterFormPhraseFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterFormBloc, IStringValueFormFieldBloc>(
      update: (context, value, previous) => value.phraseField,
      child: StringValueFormFieldRowWidget(
        autocorrect: true,
        label: S.of(context).app_filter_edit_field_phrase_label,
        hint: S.of(context).app_filter_edit_field_phrase_hint,
        onSubmitted: null,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
