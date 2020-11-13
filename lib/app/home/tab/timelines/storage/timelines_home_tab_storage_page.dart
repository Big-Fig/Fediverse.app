import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomeTabStoragePage extends StatelessWidget {
  const TimelinesHomeTabStoragePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _TimelinesHomeTabStoragePagePageAppBarWidget(),
      body: SafeArea(
        child: const TimelinesHomeTabStorageWidget(),
      ),
    );
  }
}

class _TimelinesHomeTabStoragePagePageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _TimelinesHomeTabStoragePagePageAppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediSubPageTitleAppBar(
      title: S.of(context).app_timeline_storage_title,
      leading: const FediBackIconButton(),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: FediPadding.allBigPadding,
            child: const _TimelinesHomeTabStoragePagePageAppBarActionWidget(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => FediSubPageTitleAppBar.calculatePreferredSize();
}

class _TimelinesHomeTabStoragePagePageAppBarActionWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    return StreamBuilder<TimelinesHomeTabStorageUiState>(
      stream: timelinesHomeTabStorageBloc.uiStateStream,
      builder: (context, snapshot) {
        var uiState = snapshot.data;
        if (uiState == null) {
          return const SizedBox.shrink();
        }

        var child;
        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child = _TimelinesHomeTabStoragePagePageAppBarActionEditWidget();
            break;
          case TimelinesHomeTabStorageUiState.view:
            child = _TimelinesHomeTabStoragePagePageAppBarActionViewWidget();
            break;
        }

        return child;
      },
    );
  }
}

class _TimelinesHomeTabStoragePagePageAppBarActionViewWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    return InkWell(
      onTap: () {
        timelinesHomeTabStorageBloc.switchToEditUiState();
      },
      child: Text(
        S.of(context).app_timeline_storage_appBar_action_edit,
        style: IFediUiTextTheme.of(context).bigPrimary,
      ),
    );
  }
}

class _TimelinesHomeTabStoragePagePageAppBarActionEditWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionEditWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    return InkWell(
      onTap: () {
        timelinesHomeTabStorageBloc.switchToViewUiState();
      },
      child: Text(
        S.of(context).app_timeline_storage_appBar_action_done,
        style: IFediUiTextTheme.of(context).bigPrimary,
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
          preferences: ITimelinesHomeTabStorageLocalPreferencesBloc.of(
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
