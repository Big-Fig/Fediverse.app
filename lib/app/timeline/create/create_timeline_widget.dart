import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_widget.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CreateItemTimelinesHomeTabStorageWidget extends StatelessWidget {
  const CreateItemTimelinesHomeTabStorageWidget();

  @override
  Widget build(BuildContext context) {
    var createTimelineBloc = ICreateTimelineBloc.of(context);

    return Column(
      children: [
        // ProxyProvider<ICreateTimelineBloc, IStringValueFormFieldBloc>(
        //   update: (context, value, previous) => value.idFieldBloc,
        //   child: StringFormFieldRowWidget(
        //     label: S.of(context).app_timeline_create_field_id_label,
        //     autocorrect: true,
        //     textInputAction: TextInputAction.done,
        //     onSubmitted: null,
        //     hint: null,
        //   ),
        // ),
        ProxyProvider<ICreateTimelineBloc, IStringValueFormFieldBloc>(
          update: (context, value, previous) => value.nameFieldBloc,
          child: StringValueFormFieldRowWidget(
            label: S.of(context).app_timeline_create_field_title_label,
            autocorrect: true,
            hint: S.of(context).app_timeline_create_field_title_hint,
            textInputAction: TextInputAction.done,
            onSubmitted: null,
          ),
        ),
        ProxyProvider<ICreateTimelineBloc,
            ITimelineTypeSingleFromListValueFormFieldBloc>(
          update: (context, value, previous) => value.typeFieldBloc,
          child: const TimelineTypeSingleFromListValueFormFieldRowWidget(),
        ),
        StreamBuilder<TimelineType?>(
          stream: createTimelineBloc.typeFieldBloc.currentValueStream,
          builder: (context, snapshot) {
            var timelineType = snapshot.data;

            if (timelineType == null) {
              return const SizedBox.shrink();
            }
            return Expanded(
              child: Provider<TimelineType>.value(
                value: timelineType,
                child: const _CreateItemTimelinesHomeTabStorageSettingsWidget(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CreateItemTimelinesHomeTabStorageSettingsWidget extends StatelessWidget {
  const _CreateItemTimelinesHomeTabStorageSettingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var createTimelineBloc = ICreateTimelineBloc.of(context);

    return StreamBuilder<IEditTimelineSettingsBloc?>(
      stream: createTimelineBloc.editTimelineSettingsBlocStream,
      builder: (context, snapshot) {
        var editBloc = snapshot.data;
        if (editBloc == null) {
          return const SizedBox.shrink();
        }
        return Provider<IEditTimelineSettingsBloc>.value(
          value: editBloc,
          child: const EditTimelineSettingsWidget(
            shrinkWrap: false,
          ),
        );
      },
    );
  }
}
