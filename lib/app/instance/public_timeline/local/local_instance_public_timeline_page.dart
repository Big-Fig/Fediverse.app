import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_widget.dart';
import 'package:fedi/app/instance/public_timeline/local/local_instance_public_timeline_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstancePublicTimelinePage extends StatelessWidget {
  const LocalInstancePublicTimelinePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceHostAppBarWidget(),
      body: const SafeArea(
        child: InstancePublicTimelineWidget(),
      ),
    );
  }
}

MaterialPageRoute createLocalInstancePublicTimelinePageRoute() => MaterialPageRoute(
      builder: (context) => LocalInstancePublicTimelineBloc.provideToContext(
        context,
        child: const LocalInstancePublicTimelinePage(),
      ),
    );

void goToLocalInstancePublicTimelinePage(BuildContext context) {
  Navigator.push(
    context,
    createLocalInstancePublicTimelinePageRoute(),
  );
}
