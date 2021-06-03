import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_widget.dart';
import 'package:fedi/app/instance/public_timeline/remote/remote_instance_public_timeline_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteInstancePublicTimelinePage extends StatelessWidget {
  const RemoteInstancePublicTimelinePage();

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

MaterialPageRoute createRemoteInstancePublicTimelinePageRoute(Uri remoteInstanceUri) =>
    MaterialPageRoute(
      builder: (context) => RemoteInstanceBloc.provideToContext(
        context,
        instanceUri: remoteInstanceUri,
        child: RemoteInstancePublicTimelineBloc.provideToContext(
          context,
          child: const RemoteInstancePublicTimelinePage(),
        ),
      ),
    );

void goToRemoteInstancePublicTimelinePage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) {
  Navigator.push(
    context,
    createRemoteInstancePublicTimelinePageRoute(remoteInstanceUri),
  );
}
