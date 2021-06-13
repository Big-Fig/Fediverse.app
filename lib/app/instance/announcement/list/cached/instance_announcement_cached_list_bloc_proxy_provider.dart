import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/app/instance/announcement/list/instance_announcement_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  InstanceAnnouncementCachedListBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IInstanceAnnouncementCachedListBloc,
        IPleromaCachedListBloc<IInstanceAnnouncement>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IInstanceAnnouncementCachedListBloc,
          IInstanceAnnouncementListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
