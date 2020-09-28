import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc_impl.dart';
import 'package:fedi/app/timeline/create/create_timeline_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateItemTimelinesHomeTabStoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var createTimelineBloc = ICreateTimelineBloc.of(context, listen: false);

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.create.title".tr(),
        actions: [
          StreamBuilder<bool>(
              stream: createTimelineBloc.isReadyToSubmitStream,
              initialData: createTimelineBloc.isReadyToSubmit,
              builder: (context, snapshot) {
                var isReadyToSubmit = snapshot.data;
                return AsyncOperationButtonBuilderWidget(
                  builder: (context, onPressed) => FediIconButton(
                    icon: Icon(Icons.check),
                    color: FediColors.darkGrey,
                    onPressed: isReadyToSubmit ? onPressed : null,
                  ),
                  asyncButtonAction: createTimelineBloc.save,
                );
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: CreateItemTimelinesHomeTabStorageWidget(),
        ),
      ),
    );
  }

  const CreateItemTimelinesHomeTabStoragePage();
}

void goToCreateItemTimelinesHomeTabStoragePage(
  BuildContext context,
) {
  Navigator.push(
    context,
    createCreateItemTimelinesHomeTabStoragePageRoute(context),
  );
}

MaterialPageRoute createCreateItemTimelinesHomeTabStoragePageRoute(
    BuildContext context) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ITimelinesHomeTabStorageBloc>(
      create: (context) => TimelinesHomeTabStorageBloc(
        preferences: ITimelinesHomeTabStorageLocalPreferences.of(
          context,
          listen: false,
        ),
        authInstance:
            ICurrentAuthInstanceBloc.of(context, listen: false).currentInstance,
        preferencesService: ILocalPreferencesService.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProvider<ICreateTimelineBloc>(
        create: (context) =>
            CreateTimelineBloc(timelineSavedCallback: (Timeline timeline) {
          var timelinesHomeTabStorageBloc =
              ITimelinesHomeTabStorageBloc.of(context, listen: false);
          timelinesHomeTabStorageBloc.add(timeline);
          Navigator.of(context).pop();
        }),
        child: const CreateItemTimelinesHomeTabStoragePage(),
      ),
    ),
  );
}
