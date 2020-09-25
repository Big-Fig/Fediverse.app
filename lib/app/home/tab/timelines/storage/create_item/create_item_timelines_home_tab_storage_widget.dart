import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/form/timeline_type_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class CreateItemTimelinesHomeTabStorageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var createItemTimelinesHomeTabStorageBloc =
        ICreateItemTimelinesHomeTabStorageBloc.of(context, listen: false);

    var timelineTypeFieldBloc =
        createItemTimelinesHomeTabStorageBloc.timelineTypeFieldBloc;

    return Column(
      children: [
        FormStringFieldFormRowWidget(
          label: "app.timeline.create.field.title.label".tr(),
          autocorrect: true,
          hint: "app.timeline.create.field.title.hint".tr(),
          textInputAction: TextInputAction.done,
          onSubmitted: null,
          formStringFieldBloc:
              createItemTimelinesHomeTabStorageBloc.nameFieldBloc,
        ),
        TimelineTypeFormFieldRowWidget(
          formValueFieldBloc: timelineTypeFieldBloc,
        ),
        Expanded(
          child: StreamBuilder<TimelineType>(
            stream: timelineTypeFieldBloc.currentValueStream.distinct(),
            initialData: timelineTypeFieldBloc.currentValue,
            builder: (context, snapshot) {
              var timelineType = snapshot.data;
              var timelineSettings;

              switch (timelineType) {
                case TimelineType.public:
                  timelineSettings =
                      TimelineSettings.createDefaultPublicSettings(
                    id: TimelineSettings.generateUniqueTimelineId(),
                  );
                  break;
                case TimelineType.customList:
                  timelineSettings =
                      TimelineSettings.createDefaultCustomListSettings(
                    id: TimelineSettings.generateUniqueTimelineId(),
                    onlyInListWithRemoteId: null,
                  );
                  break;
                case TimelineType.home:
                  timelineSettings = TimelineSettings.createDefaultHomeSettings(
                    id: TimelineSettings.generateUniqueTimelineId(),
                  );
                  break;
                case TimelineType.hashtag:
                  timelineSettings =
                      TimelineSettings.createDefaultHashtagSettings(
                    id: TimelineSettings.generateUniqueTimelineId(),
                    withHashtag: null,
                  );
                  break;
                case TimelineType.account:
                  timelineSettings =
                      TimelineSettings.createDefaultAccountSettings(
                    id: TimelineSettings.generateUniqueTimelineId(),
                    onlyFromAccountWithRemoteId: null,
                  );
                  break;
              }
              return DisposableProvider<ITimelineSettingsBloc>(
                create: (context) {
                  return CreateItemTimelinesHomeTabStorageBlocTimelineSettingsBloc(
                    createItemTimelinesHomeTabStorageBloc:
                        createItemTimelinesHomeTabStorageBloc,
                    originalSettings: timelineSettings,
                  );
                },
                child: TimelineSettingsWidget(),
              );
            },
          ),
        )
      ],
    );
  }
}
