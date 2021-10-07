import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc_impl.dart';
import 'package:fedi/app/timeline/create/create_timeline_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateItemTimelinesHomeTabStoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var createTimelineBloc = ICreateTimelineBloc.of(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        createTimelineBloc.handleBackPressed();

        return false;
      },
      child: Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_timeline_create_title,
          leading: FediDismissIconButton(
            customOnPressed: () {
              createTimelineBloc.handleBackPressed();
              Navigator.of(context).pop();
            },
          ),
          actions: [
            _CreateItemTimelinesHomeTabStoragePageSaveActionWidget(
              createTimelineBloc: createTimelineBloc,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: FediPadding.allMediumPadding,
            child: const CreateItemTimelinesHomeTabStorageWidget(),
          ),
        ),
      ),
    );
  }

  const CreateItemTimelinesHomeTabStoragePage();
}

class _CreateItemTimelinesHomeTabStoragePageSaveActionWidget
    extends StatelessWidget {
  const _CreateItemTimelinesHomeTabStoragePageSaveActionWidget({
    Key? key,
    required this.createTimelineBloc,
  }) : super(key: key);

  final ICreateTimelineBloc createTimelineBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: createTimelineBloc.isHaveChangesAndNoErrorsStream,
      initialData: createTimelineBloc.isHaveChangesAndNoErrors,
      builder: (context, snapshot) {
        var isReadyToSubmit = snapshot.data;

        return AsyncOperationButtonBuilderWidget(
          builder: (context, onPressed) => FediIconButton(
            icon: Icon(Icons.check),
            color: IFediUiColorTheme.of(context).darkGrey,
            onPressed: isReadyToSubmit! ? onPressed : null,
          ),
          asyncButtonAction: createTimelineBloc.save,
        );
      },
    );
  }
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
  BuildContext context,
) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ICreateTimelineBloc>(
      create: (context) => CreateTimelineBloc(
        timelineSavedCallback: (Timeline timeline) {
          var timelinesHomeTabStorageBloc =
              ITimelinesHomeTabStorageBloc.of(context, listen: false);
          timelinesHomeTabStorageBloc.add(timeline);
          Navigator.of(context).pop();
        },
        authInstance: ICurrentUnifediApiAccessBloc.of(context, listen: false)
            .currentInstance!,
        localPreferencesService: ILocalPreferencesService.of(
          context,
          listen: false,
        ),
        webSocketsSettingsBloc: IWebSocketsSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: const CreateItemTimelinesHomeTabStoragePage(),
    ),
  );
}
