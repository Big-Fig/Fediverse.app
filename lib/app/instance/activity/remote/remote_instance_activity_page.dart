import 'package:fedi/app/instance/activity/instance_activity_widget.dart';
import 'package:fedi/app/instance/activity/remote/remote_instance_activity_bloc_impl.dart';
import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteInstanceActivityPage extends StatelessWidget {
  const RemoteInstanceActivityPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceHostAppBarWidget(),
      body: const SafeArea(
        child: InstanceActivityWidget(),
      ),
    );
  }
}

MaterialPageRoute createRemoteInstanceActivityPageRoute(
  Uri remoteInstanceUri,
) =>
    MaterialPageRoute(
      builder: (context) => RemoteInstanceBloc.provideToContext(
        context,
        instanceUri: remoteInstanceUri,
        child: RemoteInstanceActivityBloc.provideToContext(
          context,
          child: const RemoteInstanceActivityPage(),
        ),
      ),
    );

void goToRemoteInstanceActivityPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) {
  Navigator.push(
    context,
    createRemoteInstanceActivityPageRoute(remoteInstanceUri),
  );
}
