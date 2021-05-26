import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/cached/instance_announcement_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_cached_pagination_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_pagination_list_widget.dart';
import 'package:fedi/app/instance/announcement/settings/edit/instance/edit_instance_instance_announcement_settings_dialog.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_instance_announcement_list_title,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: FediSizes.bigPadding),
            child: FediIconButton(
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

// ignore: long-method
MaterialPageRoute createInstanceAnnouncementListPageRoute({
  required BuildContext context,
}) =>
    MaterialPageRoute(
      builder: (context) =>
          DisposableProvider<IInstanceAnnouncementCachedListBloc>(
        create: (context) {
          var instanceAnnouncementSettingsLocalPreferenceBloc =
              IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc.of(
            context,
            listen: false,
          );

          var bloc = InstanceAnnouncementCachedListBloc.createFromContext(
            context,
            instanceAnnouncementSettings:
                instanceAnnouncementSettingsLocalPreferenceBloc.value!,
          );

          bloc.addDisposable(
            streamSubscription:
                instanceAnnouncementSettingsLocalPreferenceBloc.stream.listen(
              (settings) {
                bloc.changeInstanceAnnouncementSettings(settings!);
              },
            ),
          );

          return bloc;
        },
        child: InstanceAnnouncementCachedPaginationBloc.provideToContext(
          context,
          child: DisposableProvider<
              ICachedPaginationListBloc<
                  CachedPaginationPage<IInstanceAnnouncement>,
                  IInstanceAnnouncement>>(
            create: (BuildContext context) {
              var bloc = InstanceAnnouncementCachedPaginationListBloc
                  .createFromContext(context);

              var instanceAnnouncementCachedListBloc =
                  IInstanceAnnouncementCachedListBloc.of(
                context,
                listen: false,
              );

              bloc.addDisposable(
                streamSubscription: instanceAnnouncementCachedListBloc
                    .instanceAnnouncementSettingsStream
                    .listen(
                  (_) {
                    bloc.refreshWithController();
                  },
                ),
              );

              return bloc;
            },
            child: ProxyProvider<
                ICachedPaginationListBloc<
                    CachedPaginationPage<IInstanceAnnouncement>,
                    IInstanceAnnouncement>,
                ICachedPaginationListBloc>(
              update: (context, value, previous) => value,
              child: CachedPaginationListBlocProxyProvider<
                  CachedPaginationPage<IInstanceAnnouncement>,
                  IInstanceAnnouncement>(
                child: const InstanceAnnouncementListPage(),
              ),
            ),
          ),
        ),
      ),
    );
