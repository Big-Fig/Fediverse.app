import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_widget.dart';
import 'package:fedi/app/timeline/create/create_timeline_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomeTabStoragePage extends StatelessWidget {
  const TimelinesHomeTabStoragePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.storage.title".tr(),
        actions: [
          Padding(
            padding: FediPadding.horizontalBigPadding,
            child: FediIconButton(
              icon: Icon(FediIcons.plus),
              color: FediColors.darkGrey,
              onPressed: () {
                goToCreateItemTimelinesHomeTabStoragePage(context);
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: TimelinesHomeTabStorageWidget(),
      ),
    );
  }
}

void goToTimelinesHomeTabStoragePage(BuildContext context) {
  Navigator.push(
    context,
    createTimelinesHomeTabStoragePageRoute(),
  );
}

MaterialPageRoute createTimelinesHomeTabStoragePageRoute() => MaterialPageRoute(
      builder: (context) => DisposableProvider<ITimelinesHomeTabStorageBloc>(
        create: (context) => TimelinesHomeTabStorageBloc(
          preferences: ITimelinesHomeTabStorageLocalPreferences.of(
            context,
            listen: false,
          ),
          authInstance: ICurrentAuthInstanceBloc.of(context, listen: false)
              .currentInstance,
          preferencesService: ILocalPreferencesService.of(
            context,
            listen: false,
          ),
        ),
        child: const TimelinesHomeTabStoragePage(),
      ),
    );
