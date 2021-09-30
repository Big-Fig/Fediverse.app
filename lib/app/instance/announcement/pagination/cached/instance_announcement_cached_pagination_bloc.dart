import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IInstanceAnnouncement> {
  static IInstanceAnnouncementCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
