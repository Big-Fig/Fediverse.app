import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/instance_announcement_list_bloc.dart';
import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementCachedListBloc extends DisposableOwner
    implements
        IPleromaCachedListBloc<IInstanceAnnouncement>,
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

  Future changeInstanceAnnouncementSettings(
    InstanceAnnouncementSettings settings,
  );

  @override
  IPleromaApi get pleromaApi;

  @override
  Future<List<IInstanceAnnouncement>> loadLocalItems({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  });

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  });
}
