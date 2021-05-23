import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/cached/instance_announcement_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_cached_pagination_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_pagination_list_widget.dart';
import 'package:fedi/app/instance/announcement/settings/edit/instance/edit_instance_instance_announcement_settings_dialog.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceAnnouncementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_instance_announcement_list_title,
        actions: [
          FediIconButton(
            icon: Icon(
              FediIcons.settings,
              color: IFediUiColorTheme.of(context).darkGrey,
            ),
            onPressed: () {
              showEditInstanceInstanceAnnouncementSettingsDialog(
                context: context,
              );
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: InstanceAnnouncementPaginationListWidget(
          customEmptyWidget: _InstanceAnnouncementListPagePageEmptyWidget(),
          alwaysShowFooter: false,
        ),
      ),
    );
  }

  const InstanceAnnouncementListPage();
}

class _InstanceAnnouncementListPagePageEmptyWidget extends StatelessWidget {
  const _InstanceAnnouncementListPagePageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FediEmptyWidget(
          title: s.app_instance_announcement_list_empty,
        ),
      ],
    );
  }
}

void goToInstanceAnnouncementListPage(
  BuildContext context,
) {
  Navigator.push(
    context,
    createInstanceAnnouncementListPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute createInstanceAnnouncementListPageRoute({
  required BuildContext context,
}) {
  return MaterialPageRoute(
    builder: (context) {
      var instanceAnnouncementSettingsLocalPreferenceBloc =
          IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc.of(context);
      return InstanceAnnouncementCachedListBloc.provideToContext(
        context,
        child: InstanceAnnouncementCachedPaginationBloc.provideToContext(
          context,
          child: InstanceAnnouncementCachedPaginationListBloc.provideToContext(
            context,
            child: const InstanceAnnouncementListPage(),
          ),
        ),
        instanceAnnouncementSettings:
            instanceAnnouncementSettingsLocalPreferenceBloc.value!,
      );
    },
  );
}
