import 'package:fedi_app/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IInstanceAnnouncement> {
  static IInstanceAnnouncementCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
