import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const HashtagPageBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IHashtagPageBloc, IInstanceLocationBloc>(
        update: (context, bloc, previous) => bloc,
        child: ProxyProvider<IHashtagPageBloc, ITimelineLocalPreferenceBlocOld>(
          update: (context, bloc, previous) => bloc.timelineLocalPreferenceBloc,
          child: child,
        ),
      );
}
