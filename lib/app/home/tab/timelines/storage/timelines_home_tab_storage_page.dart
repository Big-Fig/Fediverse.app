import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomeTabStoragePage extends StatelessWidget {
  const TimelinesHomeTabStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _TimelinesHomeTabStoragePagePageAppBarWidget(),
        body: SafeArea(
          child: TimelinesHomeTabStorageWidget(),
        ),
      );
}

class _TimelinesHomeTabStoragePagePageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _TimelinesHomeTabStoragePagePageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediPageTitleAppBar(
        title: S.of(context).app_timeline_storage_title,
        leading: const FediBackIconButton(),
        actions: const [
          _TimelinesHomeTabStoragePagePageAppBarActionWidget(),
        ],
      );

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

class _TimelinesHomeTabStoragePagePageAppBarActionWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionWidget({
    Key? key,
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

        Widget child;
        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child =
                const _TimelinesHomeTabStoragePagePageAppBarActionDoneWidget();
            break;
          case TimelinesHomeTabStorageUiState.view:
            child =
                const _TimelinesHomeTabStoragePagePageAppBarActionEditWidget();
            break;
        }

        return child;
      },
    );
  }
}

class _TimelinesHomeTabStoragePagePageAppBarActionEditWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionEditWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return FediPageAppBarTextActionWidget(
      text: S.of(context).app_timeline_storage_appBar_action_edit,
      color: fediUiColorTheme.darkGrey,
      onPressed: () {
        timelinesHomeTabStorageBloc.switchToEditUiState();
      },
    );
  }
}

class _TimelinesHomeTabStoragePagePageAppBarActionDoneWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStoragePagePageAppBarActionDoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    return FediPageAppBarTextActionWidget(
      text: S.of(context).app_timeline_storage_appBar_action_done,
      onPressed: () {
        timelinesHomeTabStorageBloc.switchToViewUiState();
      },
    );
  }
}

void goToTimelinesHomeTabStoragePage(BuildContext context) {
  Navigator.push(
    context,
    createTimelinesHomeTabStoragePageRoute(),
  );
}

MaterialPageRoute<void> createTimelinesHomeTabStoragePageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => const TimelinesHomeTabStoragePage(),
    );
