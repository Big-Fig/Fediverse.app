import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/instance_announcement_list_bloc.dart';
import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IInstanceAnnouncementCachedListBloc extends DisposableOwner
    implements
        ICachedListBloc<IInstanceAnnouncement>,
        IInstanceAnnouncementListBloc {
  static IInstanceAnnouncementCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementCachedListBloc>(
        context,
        listen: listen,
      );

  InstanceAnnouncementSettings get instanceAnnouncementSettings;

  Stream<InstanceAnnouncementSettings> get instanceAnnouncementSettingsStream;

  Future<void> changeInstanceAnnouncementSettings(
    InstanceAnnouncementSettings settings,
  );

  @override
  IUnifediApiService get unifediApi;

  @override
  Future<List<IInstanceAnnouncement>> loadLocalItems({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  });

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  });
}
