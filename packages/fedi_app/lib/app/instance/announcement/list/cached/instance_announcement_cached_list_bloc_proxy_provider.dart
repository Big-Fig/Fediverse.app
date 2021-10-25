import 'package:fedi_app/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi_app/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi_app/app/instance/announcement/list/instance_announcement_list_bloc.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const InstanceAnnouncementCachedListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IInstanceAnnouncementCachedListBloc,
          ICachedListBloc<IInstanceAnnouncement>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IInstanceAnnouncementCachedListBloc,
            IInstanceAnnouncementListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
